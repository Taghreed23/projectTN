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
    apiKey: 'AIzaSyAUtEuBiGeQvwufQT5ovzFcxbwEbXhZvwI',
    appId: '1:1074828286502:web:0acbff6d5db0c89152e4e7',
    messagingSenderId: '1074828286502',
    projectId: 'foodwast-c5bf4',
    authDomain: 'foodwast-c5bf4.firebaseapp.com',
    storageBucket: 'foodwast-c5bf4.appspot.com',
    measurementId: 'G-1P5LWC218K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjws4g41QlQPZFZpm7cm__XWkOV9M_YPM',
    appId: '1:1074828286502:android:1c9120d6ffafcdde52e4e7',
    messagingSenderId: '1074828286502',
    projectId: 'foodwast-c5bf4',
    storageBucket: 'foodwast-c5bf4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2NFWuowKYGUxuAJZCpoxjx7Q9LpGAAdQ',
    appId: '1:1074828286502:ios:96f0b86203126c3a52e4e7',
    messagingSenderId: '1074828286502',
    projectId: 'foodwast-c5bf4',
    storageBucket: 'foodwast-c5bf4.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2NFWuowKYGUxuAJZCpoxjx7Q9LpGAAdQ',
    appId: '1:1074828286502:ios:a34e490dba38a54352e4e7',
    messagingSenderId: '1074828286502',
    projectId: 'foodwast-c5bf4',
    storageBucket: 'foodwast-c5bf4.appspot.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}
