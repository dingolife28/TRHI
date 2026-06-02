import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  // Alle Plattformen (Web, Android, iOS) nutzen dasselbe Firebase-Projekt
  // 'trhi-app'. Cloud Firestore authentifiziert über Projekt-ID + Security
  // Rules, daher genügen dieselben Projekt-Credentials für alle Plattformen
  // (Firebase-API-Keys sind ohnehin öffentlich, kein Secret). Dadurch
  // funktioniert die Buchung (Dateneintrag) jetzt auch auf Mobile.
  //
  // Für saubere, plattform-spezifische App-Registrierungen später einfach
  // `flutterfire configure` ausführen — das überschreibt diese Datei.
  static FirebaseOptions get currentPlatform => web;

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDUpyUnaJ0ag6EX2if5o6zDQGAtKIuRF1g',
    appId: '1:191303276711:web:f53cf3362f203b0335a382',
    messagingSenderId: '191303276711',
    projectId: 'trhi-app',
    authDomain: 'trhi-app.firebaseapp.com',
    storageBucket: 'trhi-app.firebasestorage.app',
    measurementId: 'G-KGEBRPF0Q8',
  );
}
