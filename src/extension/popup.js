import { CONFIG } from './config.js';

const API_URL = CONFIG.API_URL;
const searchInput = document.getElementById('search');
const langSelect = document.getElementById('lang');
const moodSelect = document.getElementById('mood');
const resultsDiv = document.getElementById('results');

let currentClosings = [];
let selectedIndex = 0;

async function fetchClosings() {
  resultsDiv.innerHTML = '<div style="font-size:12px; color:#a0aec0;">Lade...</div>';
  
  const lang = langSelect.value;
  const mood = moodSelect.value;
  
  let url = `${API_URL}?lang=${lang}&limit=50`; // Grössere Menge laden für lokale Suche
  if (mood) url += `&mood=${mood}`;

  try {
    const res = await fetch(url);
    const json = await res.json();

    if (json.data) {
      currentClosings = json.data;
      filterAndRender();
    }
  } catch (err) {
    resultsDiv.innerHTML = '<div style="font-size:12px; color:#e53e3e;">API nicht erreichbar.</div>';
  }
}

function filterAndRender() {
  const query = searchInput.value.toLowerCase().trim();
  
  // Clientseitige Volltextsuche über Phrase, Category, Mood und Tags
  const filtered = currentClosings.filter(item => {
    const matchPhrase = item.phrase.toLowerCase().includes(query);
    const matchCategory = item.category.toLowerCase().includes(query);
    const matchMood = item.mood.toLowerCase().includes(query);
    const matchTags = Array.isArray(item.tags) && item.tags.some(t => t.toLowerCase().includes(query));
    return matchPhrase || matchCategory || matchMood || matchTags;
  });

  selectedIndex = 0; // Reset Auswahl bei neuer Suche
  renderList(filtered);
}

function renderList(items) {
  resultsDiv.innerHTML = '';
  
  if (items.length === 0) {
    resultsDiv.innerHTML = '<div style="font-size:12px; color:#a0aec0; padding:8px;">Keine Treffer.</div>';
    return;
  }

  items.forEach((item, index) => {
    const div = document.createElement('div');
    div.className = `item ${index === selectedIndex ? 'selected' : ''}`;
    div.dataset.index = index;
    div.innerHTML = `
      <div><strong>${item.phrase}</strong></div>
      <div class="item-sub">${item.category} • ${item.mood}</div>
    `;
    
    div.addEventListener('click', () => insertTextIntoPage(item.phrase));
    div.addEventListener('mouseenter', () => {
      selectedIndex = index;
      updateSelectionClass();
    });

    resultsDiv.appendChild(div);
  });
}

function updateSelectionClass() {
  const elements = resultsDiv.querySelectorAll('.item');
  elements.forEach((el, idx) => {
    if (idx === selectedIndex) {
      el.classList.add('selected');
      el.scrollIntoView({ block: 'nearest' });
    } else {
      el.classList.remove('selected');
    }
  });
}

async function insertTextIntoPage(text) {
  const [tab] = await chrome.tabs.query({ active: true, currentWindow: true });
  
  chrome.scripting.executeScript({
    target: { tabId: tab.id },
    func: (textToInsert) => {
      const activeEl = document.activeElement;
      if (activeEl && (activeEl.tagName === 'INPUT' || activeEl.tagName === 'TEXTAREA')) {
        const start = activeEl.selectionStart;
        const end = activeEl.selectionEnd;
        const val = activeEl.value;
        activeEl.value = val.substring(0, start) + "\n\n" + textToInsert + val.substring(end);
      } else if (activeEl && activeEl.isContentEditable) {
        document.execCommand('insertText', false, "\n\n" + textToInsert);
      } else {
        navigator.clipboard.writeText(textToInsert);
      }
    },
    args: [text]
  });

  window.close(); // Popup schliessen nach Injektion
}

// Keyboard Navigation (Pfeiltasten + Enter)
document.addEventListener('keydown', (e) => {
  const items = resultsDiv.querySelectorAll('.item');
  if (items.length === 0) return;

  if (e.key === 'ArrowDown') {
    e.preventDefault();
    selectedIndex = (selectedIndex + 1) % items.length;
    updateSelectionClass();
  } else if (e.key === 'ArrowUp') {
    e.preventDefault();
    selectedIndex = (selectedIndex - 1 + items.length) % items.length;
    updateSelectionClass();
  } else if (e.key === 'Enter') {
    e.preventDefault();
    const selectedEl = items[selectedIndex];
    if (selectedEl) {
      selectedEl.click();
    }
  }
});

// Event Listener
searchInput.addEventListener('input', filterAndRender);
langSelect.addEventListener('change', fetchClosings);
moodSelect.addEventListener('change', fetchClosings);

// Initial Load
fetchClosings();