const CACHE_NAME = 'idioms-v1';
const urlsToCache = [
  '/',
  '/manifest.json',
  // Твой сайт кэшируется автоматически
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});