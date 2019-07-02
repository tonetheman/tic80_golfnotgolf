var CACHE_NAME = 'golfnotgolf-cache-v1';
var urlsToCache = [
  '/index.html'
];

self.addEventListener('install', function(event) {
  // Perform install steps
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(function(cache) {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});

self.addEventListener("fetch", function(e) {
	e.respondWith(
		caches.match(e.request)
		.then(function(response) {
			if (response) {
				return response;
			}
			return fetch(e.request);
		});
	);
});
