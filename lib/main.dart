import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/binds/counter.dart';
import 'package:primeiroapp/pages/home.dart';
import 'package:primeiroapp/pages/second.dart';
import 'package:primeiroapp/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
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
