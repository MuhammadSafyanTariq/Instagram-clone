// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBqRsqlEIYAkCo17OP1GgO3zyrVn9bXTRg',
    appId: '1:1087598849575:web:c3a7e521162fc2db796802',
    messagingSenderId: '1087598849575',
    projectId: 'insta-clone-a7798',
    authDomain: 'insta-clone-a7798.firebaseapp.com',
    storageBucket: 'insta-clone-a7798.appspot.com',
    measurementId: 'G-EEF8HH8NMB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvW4B3z-T6i7UmVOECpj1L5L1DJ1Ak5gA',
    appId: '1:1087598849575:android:ba0b2b0c669a4a41796802',
    messagingSenderId: '1087598849575',
    projectId: 'insta-clone-a7798',
    storageBucket: 'insta-clone-a7798.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsy61SYm8yc9At39qbyfzHgtjrx72nTPw',
    appId: '1:1087598849575:ios:58109f41648388ae796802',
    messagingSenderId: '1087598849575',
    projectId: 'insta-clone-a7798',
    storageBucket: 'insta-clone-a7798.appspot.com',
    iosClientId: '1087598849575-h89sa543k30j4fab2ogai5vj321cmn0k.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsy61SYm8yc9At39qbyfzHgtjrx72nTPw',
    appId: '1:1087598849575:ios:58109f41648388ae796802',
    messagingSenderId: '1087598849575',
    projectId: 'insta-clone-a7798',
    storageBucket: 'insta-clone-a7798.appspot.com',
    iosClientId: '1087598849575-h89sa543k30j4fab2ogai5vj321cmn0k.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaClone',
  );
}
