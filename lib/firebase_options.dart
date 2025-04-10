// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBupAGUdAt10_4pVtFj05gRwHKs9Mf6z4Q',
    appId: '1:137257898562:web:9513c11ee6bc0d87a413db',
    messagingSenderId: '137257898562',
    projectId: 'flutter-demo-loan',
    authDomain: 'flutter-demo-loan.firebaseapp.com',
    storageBucket: 'flutter-demo-loan.firebasestorage.app',
    measurementId: 'G-D7R492K728',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4U99E6wSSajmdLaM8BXmeLt2Hz8YmkEA',
    appId: '1:137257898562:android:f30e0e040bde4bc3a413db',
    messagingSenderId: '137257898562',
    projectId: 'flutter-demo-loan',
    storageBucket: 'flutter-demo-loan.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYwUqJwH2ETuqKw0orbhHhEzXVTJuFVT0',
    appId: '1:137257898562:ios:c4ff4a429103d785a413db',
    messagingSenderId: '137257898562',
    projectId: 'flutter-demo-loan',
    storageBucket: 'flutter-demo-loan.firebasestorage.app',
    iosBundleId: 'com.example.flutterGki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYwUqJwH2ETuqKw0orbhHhEzXVTJuFVT0',
    appId: '1:137257898562:ios:c4ff4a429103d785a413db',
    messagingSenderId: '137257898562',
    projectId: 'flutter-demo-loan',
    storageBucket: 'flutter-demo-loan.firebasestorage.app',
    iosBundleId: 'com.example.flutterGki',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBupAGUdAt10_4pVtFj05gRwHKs9Mf6z4Q',
    appId: '1:137257898562:web:547fb4353689b697a413db',
    messagingSenderId: '137257898562',
    projectId: 'flutter-demo-loan',
    authDomain: 'flutter-demo-loan.firebaseapp.com',
    storageBucket: 'flutter-demo-loan.firebasestorage.app',
    measurementId: 'G-4D2F42GXJ7',
  );
}
