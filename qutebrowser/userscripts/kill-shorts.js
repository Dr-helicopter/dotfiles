// ==UserScript==
// @name Change YouTube Search Placeholder
// @match *://www.youtube.com/*
// @run-at document-end
// ==/UserScript==

(function() {
  const searchInput = document.querySelector('input[name="search_query"]');
  if (searchInput) {
    searchInput.setAttribute('placeholder', 'arch');
  }
})();

