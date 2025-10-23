'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "067aaa0a646a9ffc2a508fbbee22a2ac",
"icons/Icon-maskable-512.png": "067aaa0a646a9ffc2a508fbbee22a2ac",
"icons/Icon-192.png": "becefc3164fa67827a2e9e2d128677f6",
"icons/Icon-maskable-192.png": "becefc3164fa67827a2e9e2d128677f6",
"manifest.json": "20bfedc25c4e27943c8e81a1ef69aae3",
"index.html": "3dbf2e6e78d7b6f31dbc80044d52f0e6",
"/": "3dbf2e6e78d7b6f31dbc80044d52f0e6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "47ce06ddade055bfd06693369fa679b3",
"assets/assets/icons/logo/spotify.svg": "c994e71b4a097890520d821042bc2e3e",
"assets/assets/icons/logo/laravel.svg": "b13c4e6cf1231824b8db821b45f5ef23",
"assets/assets/icons/logo/dart.svg": "5a7ce19cb317e6b304217f2126da2419",
"assets/assets/icons/logo/github.svg": "155e9b87cc67b151574ef957c6145c65",
"assets/assets/icons/logo/javascript.svg": "cec934bf49ec816ad964af4b660c3736",
"assets/assets/icons/logo/php.svg": "b73e57b4434f071f639d10058073f2f7",
"assets/assets/icons/logo/firebase.svg": "d52f75cb43bca604d8b24a4596e5c207",
"assets/assets/icons/logo/linkedinnew.svg": "bdf55e769e9c042a7aea7b675aea8d3f",
"assets/assets/icons/logo/instagram.svg": "c66f066cb3c1dfcebb4be4bd98204a4c",
"assets/assets/icons/menu_burger.svg": "0d01bcf314a4f012b36dc3c0643ad81f",
"assets/assets/images/avatar_skill.png": "c076b750d0ef77189bebfc77a815ee08",
"assets/assets/images/my_avatar.png": "de8eec263f70da333d5bf488d1b727da",
"assets/assets/images/logo_stevor.png": "5cb155855e2b0ad46d9d3f96fe28cd77",
"assets/assets/images/app_smartmind.png": "67c96eaffaa86679a74059fa439c0f80",
"assets/assets/images/logo_warmingup.png": "58e758c1e1035101aed79f0c0c63bb68",
"assets/assets/images/certification_4.png": "3a37a72a31afcaf032aa5759fdbd8413",
"assets/assets/images/app_stevor.png": "5fd343adbc973702f4241a46a07267f9",
"assets/assets/images/icon_laptop.svg": "23657d9c817127ae8f174dc206ee44b9",
"assets/assets/images/certification_3.png": "11d1469cd6783b5bb85efaa6e997e0b1",
"assets/assets/images/app_driver.png": "a8b704c830f9aa4157bd393263a68d7b",
"assets/assets/images/certification_1.png": "efb7f443820f510d83bf429394df84d5",
"assets/assets/images/certification_2.png": "d857783ab65d823ba4f9dab454264427",
"assets/assets/images/logo_telkom.png": "4427616f30dc61d75600aa64dff0e3cd",
"assets/assets/images/certification_5.png": "c887775d2ac4ed0286898c86c9c97626",
"assets/fonts/MaterialIcons-Regular.otf": "3b54980a69cdf16f5ec8eb73a7f254ed",
"assets/NOTICES": "2a8628de8cab8ac83f9e033c16904c04",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "feaf0856e1fef4dc7f036291ad10020a",
"assets/AssetManifest.json": "a88e28487fec5f58ce77088941b8db97",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.png": "da2cbb6e7915116df2a859dd3c50268a",
"flutter_bootstrap.js": "d4f59720344a6290d658ad5f263c9064",
"version.json": "ca9c8e52ab52c5a38d879a85f632610e",
"main.dart.js": "11938a33d4d63ead849e2fdf227cb12f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
