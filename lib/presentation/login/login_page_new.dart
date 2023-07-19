import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/square_tile.dart';
import '../components/textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//sign user in
  void SignUserIn() async {
    //show loading dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              SizedBox(width: 20),
              Text("Logging in..."),
            ],
          ),
        );
      },
    );
    //try to sign user in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      //close loading dialog
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //close loading dialog
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }

  //show dialog if email is wrong
  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Email did not match any account"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  //show dialog if password is wrong
  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Please check your password and try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Image.asset(
                  "assets/img/logo.png",
                  height: 200,
                ),
                //welcome message
                Text(
                  "Please Login to Continue",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 20),
                //login form with text fields
                //username
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),
                SizedBox(height: 10),
                //password
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obsecureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                //forgot password text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                //login button
                MyButton(
                  text: "Login",
                  onTap: SignUserIn,
                ),
                SizedBox(
                  height: 40,
                ),
                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google logo
                    SquareTile(imagePath: "assets/img/google.png"),
                    SizedBox(
                      width: 20,
                    ),
                    // //apple logo
                    // SquareTile(imagePath: "assets/images/apple.png"),
                    // SizedBox(width: 20),
                    //facebook logo
                    SquareTile(imagePath: "assets/img/facebook.png"),
                    SizedBox(width: 20),
                    //twitter logo
                    SquareTile(imagePath: "assets/img/twitter.png"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
