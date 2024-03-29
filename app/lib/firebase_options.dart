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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCX5VqgMXkzkAVkoThuIq-KFX3JAETOInM',
    appId: '1:907454945637:android:03a2244e3dc3224acd698c',
    messagingSenderId: '907454945637',
    projectId: 'sharecation-production',
    storageBucket: 'sharecation-production.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHCJZcfGiAgKPXfqXmAdI-ItwywFRIs-g',
    appId: '1:907454945637:ios:bab5100fab53e4fccd698c',
    messagingSenderId: '907454945637',
    projectId: 'sharecation-production',
    storageBucket: 'sharecation-production.appspot.com',
    androidClientId: '907454945637-85qlip23r151aspsct3lo5f86s1mrd11.apps.googleusercontent.com',
    iosClientId: '907454945637-b0cbtsi0btbsoh7b64r0a0esdtsha4sm.apps.googleusercontent.com',
    iosBundleId: 'dev.wolfisberg.sharecation.sharecationApp',
  );
}
