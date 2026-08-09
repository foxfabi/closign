import { CONFIG } from './config.js';

const API_URL = CONFIG.API_URL;

// Setup Context Menu on Install
chrome.runtime.onInstalled.addListener(() => {
  chrome.contextMenus.create({
    id: 'closign-parent',
    title: 'Closign einfügen...',
    contexts: ['editable']
  });

  const moods = [
    { id: 'neutral', title: 'Neutral' },
    { id: 'annoyed', title: 'Genervt' },
    { id: 'sensual', title: 'Lustvoll' },
    { id: 'ironic', title: 'Ironisch' },
    { id: 'location_based', title: 'Ort / Natur' }
  ];

  moods.forEach(m => {
    chrome.contextMenus.create({
      id: `closign-mood-${m.id}`,
      parentId: 'closign-parent',
      title: m.title,
      contexts: ['editable']
    });
  });
});

// Handle Context Menu Clicks
chrome.contextMenus.onClicked.addListener(async (info, tab) => {
  if (info.menuItemId.startsWith('closign-mood-')) {
    const mood = info.menuItemId.replace('closign-mood-', '');
    
    try {
      const res = await fetch(`${API_URL}?lang=de&mood=${mood}&limit=1`);
      const json = await res.json();

      if (json.data && json.data.length > 0) {
        const textToInsert = json.data[0].phrase;

        // Inject text into the active element
        chrome.scripting.executeScript({
          target: { tabId: tab.id },
          func: (text) => {
            const el = document.activeElement;
            if (el && (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA')) {
              const start = el.selectionStart;
              const end = el.selectionEnd;
              el.value = el.value.substring(0, start) + "\n\n" + text + el.value.substring(end);
            } else if (el && el.isContentEditable) {
              document.execCommand('insertText', false, "\n\n" + text);
            }
          },
          args: [textToInsert]
        });
      }
    } catch (err) {
      console.error('Closign Context Menu Error:', err);
    }
  }
});