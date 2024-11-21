
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/binds/counter.dart';
import 'package:primeiroapp/firebase_options.dart';
import 'package:primeiroapp/pages/AuthPage.dart';
import 'package:primeiroapp/pages/home.dart';
import 'package:primeiroapp/pages/second.dart';
import 'package:primeiroapp/pages/splash.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/auth',
          page: () => const Authpage(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
          binding: SampleBind(),
        ),
        GetPage(
          name: '/second',
          page: () => const Second(),
          binding: SampleBind(),
        ),
      ],
    );
  }
}
