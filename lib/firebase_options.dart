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
    apiKey: 'AIzaSyCpfn2lcX36T78f7wELtFfR_9ub2_TLpKU',
    appId: '1:951226773130:web:dcbf282aded09cec01c773',
    messagingSenderId: '951226773130',
    projectId: 'primeiroapp-2abc1',
    authDomain: 'primeiroapp-2abc1.firebaseapp.com',
    storageBucket: 'primeiroapp-2abc1.firebasestorage.app',
    measurementId: 'G-QL5CZFBVWQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbwgvsPdiHqgXh1RI_SCn6URdXhVs4ZKw',
    appId: '1:951226773130:android:5d13153d740fe7b101c773',
    messagingSenderId: '951226773130',
    projectId: 'primeiroapp-2abc1',
    storageBucket: 'primeiroapp-2abc1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVA96prscQtNIGPYQPB26jkHxTxycjJh0',
    appId: '1:951226773130:ios:2d17590c875effb901c773',
    messagingSenderId: '951226773130',
    projectId: 'primeiroapp-2abc1',
    storageBucket: 'primeiroapp-2abc1.firebasestorage.app',
    iosBundleId: 'com.example.primeiroapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVA96prscQtNIGPYQPB26jkHxTxycjJh0',
    appId: '1:951226773130:ios:2d17590c875effb901c773',
    messagingSenderId: '951226773130',
    projectId: 'primeiroapp-2abc1',
    storageBucket: 'primeiroapp-2abc1.firebasestorage.app',
    iosBundleId: 'com.example.primeiroapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCpfn2lcX36T78f7wELtFfR_9ub2_TLpKU',
    appId: '1:951226773130:web:a8218a489315676801c773',
    messagingSenderId: '951226773130',
    projectId: 'primeiroapp-2abc1',
    authDomain: 'primeiroapp-2abc1.firebaseapp.com',
    storageBucket: 'primeiroapp-2abc1.firebasestorage.app',
    measurementId: 'G-NCS1CCE9ZD',
  );
}
