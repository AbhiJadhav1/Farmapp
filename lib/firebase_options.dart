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
    apiKey: 'AIzaSyDOB3GueaV7v4XTYTC1F8phZgWhbQoOPHA',
    appId: '1:672519898118:web:620bad9186e55924876f87',
    messagingSenderId: '672519898118',
    projectId: 'community-b8f19',
    authDomain: 'community-b8f19.firebaseapp.com',
    storageBucket: 'community-b8f19.appspot.com',
    measurementId: 'G-E9G22HKT2T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAS_gX7_Vg_Kv6o5AqKTDy1z8tLINIlSEc',
    appId: '1:672519898118:android:abef28ce9dbf0fe0876f87',
    messagingSenderId: '672519898118',
    projectId: 'community-b8f19',
    storageBucket: 'community-b8f19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAltZ9nEnOwtlMxm5YTiKt_ZSXUIb6VSLM',
    appId: '1:672519898118:ios:48cef6c53ac72d83876f87',
    messagingSenderId: '672519898118',
    projectId: 'community-b8f19',
    storageBucket: 'community-b8f19.appspot.com',
    iosClientId: '672519898118-gfrvmmhpjrfe5hgpdnmei11o9bj5fqmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.communityapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAltZ9nEnOwtlMxm5YTiKt_ZSXUIb6VSLM',
    appId: '1:672519898118:ios:48cef6c53ac72d83876f87',
    messagingSenderId: '672519898118',
    projectId: 'community-b8f19',
    storageBucket: 'community-b8f19.appspot.com',
    iosClientId: '672519898118-gfrvmmhpjrfe5hgpdnmei11o9bj5fqmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.communityapp',
  );
}