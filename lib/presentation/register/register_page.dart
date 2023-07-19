import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/square_tile.dart';
import '../components/textfield.dart';

class RegPage extends StatefulWidget {
  final Function()? onTap;
  RegPage({super.key, required this.onTap});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  //text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _fullNameController = TextEditingController();

//register user
  void SignUserUp() async {
    //show loading dialog
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text("Dialog Title"),
              content: new Text("This is my content"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Yes"),
                ),
                CupertinoDialogAction(
                  child: Text("No"),
                )
              ],
            ));
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Row(
    //         children: [
    //           CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    //           ),
    //           SizedBox(width: 20),
    //           Text("Please Wait..."),
    //         ],
    //       ),
    //     );
    //   },
    // );
    // try creating the user
    try {
      // check if password is confirmed
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        // show error message, passwords don't match
        showErrorMessage("Passwords don't match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            Text(message),
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
                  "assets/images/applogo.png",
                  height: 100,
                ),

                //signup message
                Text(
                  "Sign Up to continue",
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
                  obsecureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                //Confirm password
                MyTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  obsecureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                //username
                MyTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  obsecureText: false,
                ),

                SizedBox(
                  height: 10,
                ),
                //Full Name
                MyTextField(
                  controller: _fullNameController,
                  hintText: 'Full name',
                  obsecureText: false,
                ),
                //Phone Number
                SizedBox(
                  height: 10,
                ),
                //Full Name
                MyTextField(
                  controller: _phonenumberController,
                  hintText: 'Phone number',
                  obsecureText: false,
                ),

                SizedBox(height: 20),
                //login button

                MyButton(
                  text: "Sign Up",
                  onTap: SignUserUp,
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
                  height: 40,
                ),

                //google + apple sign in buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google logo
                    SquareTile(imagePath: "assets/images/google.png"),
                    SizedBox(
                      width: 20,
                    ),
                    //apple logo
                    SquareTile(imagePath: "assets/images/apple.png"),
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
                      "Already a member?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
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
