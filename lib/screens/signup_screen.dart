import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  Future signup() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());
      Navigator.of(context).pushNamed('/');
    }
  }
  bool passwordConfirmed(){
    if( _passwordcontroller.text.trim()== _confirmpasswordcontroller.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose(){
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
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
                const Text('SIGN Up',
                    style: TextStyle(
                        fontSize : 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),
                const Text('Welcome! Here you can sign up',
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
                  child: Container  (
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _confirmpasswordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30) ,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: signup,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:const Center(child: Text('Sign Up',
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

                    const Text('Already a member ? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: const Text('Sign in here',
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


