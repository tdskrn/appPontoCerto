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
    apiKey: 'AIzaSyBf3t-9Bkp9R0SCLmM4gT5zeDjgZt0Q5xY',
    appId: '1:55598038735:web:63330c4cb0be2a385681ba',
    messagingSenderId: '55598038735',
    projectId: 'cotacaopontocerto-edd03',
    authDomain: 'cotacaopontocerto-edd03.firebaseapp.com',
    storageBucket: 'cotacaopontocerto-edd03.appspot.com',
    measurementId: 'G-HCEDL1TCV3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsJx4t33yjYbgsS3Xk_SMx2wMw1o1eSgw',
    appId: '1:55598038735:android:dc931a19d279a8665681ba',
    messagingSenderId: '55598038735',
    projectId: 'cotacaopontocerto-edd03',
    storageBucket: 'cotacaopontocerto-edd03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGklhXnCC6lojf5EM08oMia4Ez_zIJLFE',
    appId: '1:55598038735:ios:084940f9fe5c69ac5681ba',
    messagingSenderId: '55598038735',
    projectId: 'cotacaopontocerto-edd03',
    storageBucket: 'cotacaopontocerto-edd03.appspot.com',
    iosClientId: '55598038735-mgth1n7km5k95f969kfdr0vk3g980j47.apps.googleusercontent.com',
    iosBundleId: 'com.example.appAdminPontoCerto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGklhXnCC6lojf5EM08oMia4Ez_zIJLFE',
    appId: '1:55598038735:ios:7fe2eb7778f20c215681ba',
    messagingSenderId: '55598038735',
    projectId: 'cotacaopontocerto-edd03',
    storageBucket: 'cotacaopontocerto-edd03.appspot.com',
    iosClientId: '55598038735-lom93qldhrlpigam6nq7ec4bb8tlre74.apps.googleusercontent.com',
    iosBundleId: 'com.example.appAdminPontoCerto.RunnerTests',
  );
}
