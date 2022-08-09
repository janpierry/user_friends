import 'package:flutter/material.dart';
import 'package:user_friends/modules/friends/presentation/pages/friends_page.dart';
import 'package:user_friends/modules/splash/presentation/pages/splash_page.dart';
import 'package:user_friends/modules/user_profile/presentation/pages/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User friends',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const FriendsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
