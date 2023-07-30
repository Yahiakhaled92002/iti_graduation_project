import 'package:flutter/material.dart';
import 'package:project/auth.dart';

import 'package:project/screens/signup_screen.dart';
import'constants.dart';
import 'package:project/screens/home/home_screen.dart';
import 'package:project/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yahya',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Auth(),
      routes: {
        '/' :(context) =>  HomeScreen(),
        'home screen' :(context) => HomeScreen(),
        'signup screen ' : (context) => const SignupScreen(),
        'login screen' : (context) => const LoginScreen(),
      },
    );
  }
}
