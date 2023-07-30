import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState()=>_LoginScreenState();


}


  class _LoginScreenState extends State<LoginScreen>{
    final _emailcontroller = TextEditingController();
    final _passwordcontroller = TextEditingController();

    Future signIn() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword
        (email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
    }

    @override
  void dispose(){
      super.dispose();
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child :Center(
          child :SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset('assets/images/2.jpg', height:190,
        ),
            const SizedBox(height: 50),
            const Text('SIGN IN',
            style: TextStyle(
              fontSize : 50,
              color: Colors.black,
                fontWeight: FontWeight.bold
            )
         ),
             const Text('Welcome back! Nice to see you again',
            style: TextStyle(
            fontSize : 18,
                fontWeight: FontWeight.bold )),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container  (
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',

                    ),
                  ),
                ),

              ),
            ),
             const SizedBox(height: 30),
              Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container  (
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(12),
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _passwordcontroller,
              obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
        ),
              ),
            const SizedBox(height: 30) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:const Center(child: Text('Sign in',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight:FontWeight.bold,
                  )),
                ),
            ),
              )
            ),
            const SizedBox(height: 25),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 const Text('Net yet a member ? ',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                GestureDetector(
                  onTap: openSignupScreen,
                  child: const Text('Sign up Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
        ],
    ),
          ),
        ),
      ),
    );

  }
  void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed("signup screen");
  }
}

