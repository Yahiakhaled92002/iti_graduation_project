import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home/home_screen.dart';
import 'package:project/screens/login_screen.dart';
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: ((context,snapshot){
    if(snapshot.hasData){
    return HomeScreen();
    }
    else{
    return const LoginScreen();
    }
    }
    )
    ));

  }
}
