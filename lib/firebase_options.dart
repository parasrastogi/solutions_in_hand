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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC49J4GzT7dOSIYWAQ9nkTQLSnEEzJLkSg',
    appId: '1:77051304290:web:d4d5c3451868f8c409743b',
    messagingSenderId: '77051304290',
    projectId: 'exsqdm',
    authDomain: 'exsqdm.firebaseapp.com',
    storageBucket: 'exsqdm.appspot.com',
    measurementId: 'G-F58HW69W0V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClZJIcXrD5c4JHIjWyJlU_Fg3r4beIm_o',
    appId: '1:77051304290:android:098292e478b049cf09743b',
    messagingSenderId: '77051304290',
    projectId: 'exsqdm',
    storageBucket: 'exsqdm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHuqD1E8CfycFReirlhHA4WqWGBapR-6k',
    appId: '1:77051304290:ios:d49edc75530edb7109743b',
    messagingSenderId: '77051304290',
    projectId: 'exsqdm',
    storageBucket: 'exsqdm.appspot.com',
    iosClientId: '77051304290-dlgcmdiovn9jm3e7iuehtnac97gak6t5.apps.googleusercontent.com',
    iosBundleId: 'com.example.solutionsInHand',
  );
}