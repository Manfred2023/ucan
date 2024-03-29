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
    apiKey: 'AIzaSyDVl4uZ06QDv5Y-zWrAfr6u1wpBpxivoS4',
    appId: '1:471608023003:web:bbef80cab071ec5c6d79fe',
    messagingSenderId: '471608023003',
    projectId: 'ucan-c283b',
    authDomain: 'ucan-c283b.firebaseapp.com',
    storageBucket: 'ucan-c283b.appspot.com',
    measurementId: 'G-VE7V8EDEGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwF53sXY8ZCVdZFVgNhBlq61FYHWtwBkk',
    appId: '1:471608023003:android:c5cfdc55221e3cbe6d79fe',
    messagingSenderId: '471608023003',
    projectId: 'ucan-c283b',
    storageBucket: 'ucan-c283b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAk-msYQSEgllHkirzhH0WIK9q3zfyV7q0',
    appId: '1:471608023003:ios:cee2ac82e7a77fbc6d79fe',
    messagingSenderId: '471608023003',
    projectId: 'ucan-c283b',
    storageBucket: 'ucan-c283b.appspot.com',
    iosBundleId: 'com.example.ucan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAk-msYQSEgllHkirzhH0WIK9q3zfyV7q0',
    appId: '1:471608023003:ios:b9f9cb7f5ea9d2856d79fe',
    messagingSenderId: '471608023003',
    projectId: 'ucan-c283b',
    storageBucket: 'ucan-c283b.appspot.com',
    iosBundleId: 'com.example.ucan.RunnerTests',
  );
}
