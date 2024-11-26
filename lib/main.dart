
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:primeiroapp/binds/counter.dart';
import 'package:primeiroapp/firebase_options.dart';
import 'package:primeiroapp/i10/auth.dart';
import 'package:primeiroapp/pages/auth.dart';
import 'package:primeiroapp/pages/home.dart';
import 'package:primeiroapp/pages/profile.dart';
import 'package:primeiroapp/pages/splash.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async{
  await initializeDateFormatting('pt BR', null); //inicializando app em portugues br

  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  auth = FirebaseAuth.instanceFor(app: app);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //remove o icone de debug
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
        FirebaseUILocalizations.delegate,
      ],
      title: 'Flutter Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/auth',
          page: () => const Authpage(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/profile',
          page: () => const Profile(),
          binding: UserBind(),
        ),
      ],
    );
  }
}
