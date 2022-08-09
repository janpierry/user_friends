import 'package:flutter/material.dart';
import 'package:user_friends/dependency_injection/service_locator.dart';
import 'package:user_friends/modules/splash/presentation/pages/splash_page.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User friends',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
