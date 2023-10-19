'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "83b9daefa4f78e7efd70f2b5343e1793",
"assets/AssetManifest.json": "634246385a8d0855135aaca29e29c4ef",
"assets/assets/fonts/WorkSans-Bold.ttf": "f051cc0ed2761378e886727284cf3c05",
"assets/assets/fonts/WorkSans-Regular.ttf": "7d761a652f8e716f57f4352b0f4e6280",
"assets/assets/images/animo.png": "cd410c13c40657dad345cb8f78fb181a",
"assets/assets/images/bosquef.png": "c3eca62bfac92fd6c918921c53336e3b",
"assets/assets/images/bosquet.png": "5e556e402ed704a55b6981a3db0d6302",
"assets/assets/images/cerca.png": "a93aca60c1fa9cf0fe1e2d1ff52f343b",
"assets/assets/images/cisnes.png": "55f8e9f42f0d882f483b60ca7de70eb1",
"assets/assets/images/ciudad_ls.png": "fa02edf5e81ba6a76edf62dd8833e38b",
"assets/assets/images/coin_yellow.png": "a800b6a58d78b58f2009ecfb93a6d536",
"assets/assets/images/componente_rp.png": "3ff20e16776917630a1d8c6abba37f1a",
"assets/assets/images/cumplef.png": "38c76412a4ff4408c2d05f9d7eae3900",
"assets/assets/images/cumplet.png": "923940eedd0aaef6ed5c3cace65fd25f",
"assets/assets/images/desierto.png": "3d1616d705bbccb0f9c715028ed7e388",
"assets/assets/images/escala_mayor.png": "09bf7df54184effbcfb67e6c00a20889",
"assets/assets/images/escala_menor.png": "0c319340c836cccc98c81d0e9056bb92",
"assets/assets/images/foley_nivel_experto_ls.png": "6e267b28f2dd894ea31f4e9e7818fb12",
"assets/assets/images/icon_abajo.png": "e302db618f6faaaff25cee55aff7df72",
"assets/assets/images/icon_atras.png": "33b74b98888630d49ad535c1803bd381",
"assets/assets/images/icon_home.png": "9b92cf2900ed2433f0ea52cbdfef5d93",
"assets/assets/images/icon_lienzo.png": "c581f47aa3bf5756b77c42db11a5d0dc",
"assets/assets/images/icon_menu.png": "9510474e0a7379751497af1e019eaec1",
"assets/assets/images/icon_perfil2.png": "73030f12ec2ca325ba573844eee35f9c",
"assets/assets/images/icon_teoria.png": "03e8096334800f8a26f2ccd35a4edb57",
"assets/assets/images/instruccion_2.png": "4bf659b2f6f9ea3e3c488bc1443d98e3",
"assets/assets/images/instruccion_2_lienzo_sonoro.png": "40c6fd9f0eec6498d2d3ee261abf7f53",
"assets/assets/images/instruccion_3.png": "16ede48fe88678bb477d39568353c98d",
"assets/assets/images/instruccion_3_lienzo_sonoro.png": "398c0b2e6419cc391e233253557af185",
"assets/assets/images/instruccion_4.png": "1601d7e4fea1fec9c106cab4c91230e6",
"assets/assets/images/intruccion_1_rp.png": "476b871e7b91ca5c0ff4f084f02244bf",
"assets/assets/images/intruccion_2_rp.png": "7ae6739db77b5e687a8cbdfd181e62d7",
"assets/assets/images/intruccion_3_rp.png": "32339896a1d6edea8c7766d467a9edbd",
"assets/assets/images/lec1_ps.png": "88ab7ca5067b71a496f3a7861bf65fda",
"assets/assets/images/lec2_ps.png": "31076fdafed4b91f6bec03668bce9d90",
"assets/assets/images/lec3_ps.png": "0068b1e565d114bdb8e3db6b6e7f7429",
"assets/assets/images/lec4_ps.png": "822de3e674025cfe6b2f05f84435ea9b",
"assets/assets/images/lec5_ps.png": "9b16a1d3e5d9ea03214e2fcc20db980d",
"assets/assets/images/lienzo_sonoro.png": "c581f47aa3bf5756b77c42db11a5d0dc",
"assets/assets/images/ls_01.png": "b805fe544d48d69013284c92a1988337",
"assets/assets/images/moneda.png": "b85c6dff49fe63cefd0fa7ca23af5472",
"assets/assets/images/moneda_icon.png": "2f0cc163b328e08df7fa76929cc547f3",
"assets/assets/images/moneda_ls_inactive.png": "d77dd52da1bca1bc9f1af0a8a382e800",
"assets/assets/images/moneda_ps_active.png": "0b92f130cdebe76cebc81d6214032b98",
"assets/assets/images/moneda_ps_inactive.png": "550314d046469c2db291f7d6d7645427",
"assets/assets/images/moneda_rp_inactive.png": "a6fec8eae5269c55b11f44c4e4f6596d",
"assets/assets/images/mouse.png": "7628beccfa68a5e7a158e8d5e05a7483",
"assets/assets/images/niveles_ls_01.png": "6d758fa33af0951fd44af8ef7dd577dc",
"assets/assets/images/niveles_ls_02.png": "79cc8f0687c6b814c10cfe99eca2f860",
"assets/assets/images/niveles_ls_03.png": "5ce9099622c1d4d637f6db9958a4bf2b",
"assets/assets/images/niveles_ls_04.png": "e08903906d3f4ea6fd96fa9d9d54749c",
"assets/assets/images/niveles_rp_01.png": "75250b938743113f0c1073260e6e01d1",
"assets/assets/images/niveles_rp_02.png": "300f286b0ba56a2699a3dca5db5e3f8c",
"assets/assets/images/niveles_rp_03.png": "7278b17f21107d5d01b96cd4a45523ca",
"assets/assets/images/niveles_rp_04.png": "8cd48620d9b4be3272cd84ff3311f592",
"assets/assets/images/nivel_1_rp.png": "e86e7c816a5582e7a6d83067b94de1de",
"assets/assets/images/nivel_2_2_ps.png": "ccc6fbf433c0b7d9d11a7f36a9029952",
"assets/assets/images/nivel_2_ps.png": "bf26f8437377e483e5203cfc370d03c4",
"assets/assets/images/nivel_2_rp.png": "32339896a1d6edea8c7766d467a9edbd",
"assets/assets/images/nivel_3_ps.png": "20d50d192c9b6fe304818894d18ca69f",
"assets/assets/images/nivel_3_rp.png": "c99f720563cd4b048e31b62fc31b3832",
"assets/assets/images/nivel_4_2_ps.png": "a4ad77627c3ad4343ee7e453d0466bf9",
"assets/assets/images/nivel_4_ps.png": "571cc8a3dde7fe1c9be1e21b1decc68a",
"assets/assets/images/nivel_4_rp.png": "57ac661e7e7c9662905a063afed7f667",
"assets/assets/images/Nuevo_perfil_grande.png": "c695bc46d13cb22e2adc96e6d4f1cde8",
"assets/assets/images/Nuevo_perfil_grande2.png": "fb0aeae21e375f405646e18f67c3d48f",
"assets/assets/images/ojos_na.png": "7a58b90ff9fff148df05f2780575e97b",
"assets/assets/images/ojos_na_2.png": "c2ba64cefd581204b3370b175b907240",
"assets/assets/images/paisajei.png": "a687a0dce990a2f8bb5bc125da734288",
"assets/assets/images/parejaa.png": "f86109f2c676c347102f7a1e342845d7",
"assets/assets/images/pasos_ls.png": "b626503c858612e3464afcf2634bf8ef",
"assets/assets/images/perfecto.png": "5800456ecdca15b2bef7a01fbc3ef938",
"assets/assets/images/personam.png": "e450e44b44fb35abdce4dca3ee10d3a6",
"assets/assets/images/personas_amor.png": "56d47ef68400a6783eb0476e9af472e9",
"assets/assets/images/persona_miedo.png": "1cdd679e6dc49f78d7befe272da950c2",
"assets/assets/images/pincel_1.png": "73a5618b92c5fb1a4cee92cdcf1bb524",
"assets/assets/images/pincel_2.png": "e2397616cbef8b2faabf872bde8bcf5f",
"assets/assets/images/pincel_3.png": "1749e90b2fd6b1c76c7c405441f4b4cf",
"assets/assets/images/pincel_4.png": "702f23570137f7918e1ef412616bff6f",
"assets/assets/images/pintando.png": "619c6b1c88e1c1737448a5e65da74801",
"assets/assets/images/ps_01.png": "3731b5a21cb22f7008431d7a7705fa11",
"assets/assets/images/puerta_ls.png": "a92db0b711f9c2fcdb7fa3c926a81b8b",
"assets/assets/images/puerta_nivel_inicial_ls.png": "dc0a54a3d49ac129108d8ec59e83b4bc",
"assets/assets/images/ritmo.png": "c03a3c99b1a57d4f2420cebd1e6bc594",
"assets/assets/images/rp_01.png": "96993fc80470cdaf3ee27154c8c46b9b",
"assets/assets/images/stars.png": "5800456ecdca15b2bef7a01fbc3ef938",
"assets/assets/images/textura.png": "1207828012a7fdfd9a344466b67e8574",
"assets/assets/images/textura_2.png": "35f879c21eb4cbf31840904fb55d08c4",
"assets/assets/images/textura_3.png": "755d692e6145bb81fe13ffa1bb15db54",
"assets/assets/images/textura_4.png": "8e77df9e1f0af9b982a6e5f93bc222b2",
"assets/assets/images/textura_5.png": "c7b390b30a3984d35c87917daf48cf84",
"assets/assets/images/textura_6.png": "bea35b4e3a6ec966a6c9513c3ef4684c",
"assets/assets/images/trafico_nivel_intermedio_ls.png": "24030a803da2bccd5d4808ce0db3a2ba",
"assets/assets/images/ultimo_icono_lienzo_sonoro.png": "611fd1dac57d8f865b8eb0dc5a302ecf",
"assets/assets/images/voz_ls.png": "317e00371d39e57e386bb34acd5ea5d9",
"assets/assets/images/voz_nivel_avanzado_ls.png": "f8820373810a66824ea3d23e97bc0b93",
"assets/assets/sounds/acento.mp3": "0aef346654bfd2040ab77a64d67c2569",
"assets/assets/sounds/conteo1.mp3": "eaa7a763a2072d5cd071fe5914e661cf",
"assets/assets/sounds/conteo2.mp3": "57cf3fd39ea9461024a626ae8a8b3d4c",
"assets/assets/sounds/conteo3.mp3": "d1612e1b84c5ea436f5c173bf56ec2d5",
"assets/assets/sounds/conteo4.mp3": "3222e26b88820c1d6254f00596d01d09",
"assets/assets/sounds/correcto.mp3": "79c1d54cc6cdcb63793010d051a19026",
"assets/assets/sounds/cumplea%25C3%25B1os.mp3": "890b2c0f3c6ca089996f3e9162870972",
"assets/assets/sounds/cumplea%25C3%25B1os02.mp3": "6bc20112cbcffaea45b4815f5b9fc577",
"assets/assets/sounds/esccromatica.mp3": "8dfd36a039b4c8ebef828133010c3acb",
"assets/assets/sounds/eschexatonica.mp3": "8fc722df6625e7e0c808ad2a45a47a6b",
"assets/assets/sounds/escmayor.mp3": "afcfc35db72a255ea5db1dbf0da6e5c9",
"assets/assets/sounds/escmenor.mp3": "6204151f3032d182c8f8e4de69c4ccf4",
"assets/assets/sounds/melodia%2520modo%2520frigio.mp3": "7041c10ec5ddb8309187ab410dfa51fa",
"assets/assets/sounds/melodia%2520modo%2520lido.mp3": "ba4015490b73fc3af1666cf1c1e0b1ba",
"assets/assets/sounds/modofrigio.mp3": "362aca1c5db2b262792ac6d66c1f727f",
"assets/assets/sounds/ritmo%2520nivel%2520avanzado.mp3": "67c01d327e79f299c217d6686eb3c1ad",
"assets/assets/sounds/ritmo%2520nivel%2520experto.mp3": "c37a28db83b6518909f14742bbf8d0c8",
"assets/assets/sounds/ritmo%2520nivel%2520inicial%25203.mp3": "f05fe4e4ae6d2f344aa2acf0931765b1",
"assets/assets/sounds/ritmo%2520nivel%2520intermedio.mp3": "a3e8a8a54e04208ac27431191b095551",
"assets/assets/sounds/silencio.mp3": "c47a6efc8ed02563a04e87270e4fa97c",
"assets/assets/videos/instrucion_002.mp4": "e57a0ed160ae8d82246b676152b8b4f3",
"assets/assets/videos/instrucion_003.mp4": "0fe8c553143b766cd2ec9667a1a3dae0",
"assets/assets/videos/instrucion_004.mp4": "9897f76a5905b9733a19845a8cb8dc79",
"assets/assets/videos/nivel_avanzado_01.mp4": "01b5accf55caf0e82763a863ac05d974",
"assets/assets/videos/nivel_avanzado_02.mp4": "6a204e9d071a78362c5ad779baf10885",
"assets/assets/videos/nivel_experto_01.mp4": "e87b239445783974384491087ea89d13",
"assets/assets/videos/nivel_experto_02.mp4": "470b94f356655a0993cc848a3c16c149",
"assets/assets/videos/nivel_inicial.mp4": "7a396f330f6f2889d5de179d2915b0cb",
"assets/assets/videos/nivel_intermedio.mp4": "899d9820213cedcd0f4ec76a399d5528",
"assets/FontManifest.json": "6b12e88ce2ae3bcc631cda7b0e76bed9",
"assets/fonts/MaterialIcons-Regular.otf": "13aa79231d4d92b8af0b547b4d260fc1",
"assets/NOTICES": "7c04f62520a1e458cfc87b272d31b62b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "567365142eb4b91e61ab1a204b0fb5be",
"/": "567365142eb4b91e61ab1a204b0fb5be",
"main.dart.js": "faa6a7ef6c7a37bd1155ddcfca6d7089",
"manifest.json": "22afd48d31ef037b35151a68d544d9ce",
"version.json": "bd3869c9eb3b9c436bde404bffaf1714"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
