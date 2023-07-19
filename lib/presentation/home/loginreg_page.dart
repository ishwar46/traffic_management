import 'package:flutter/material.dart';

import '../login/login_page_new.dart';
import '../register/register_page.dart';

class LoginRegPage extends StatefulWidget {
  const LoginRegPage({super.key});

  @override
  State<LoginRegPage> createState() => _LoginRegPageState();
}

class _LoginRegPageState extends State<LoginRegPage> {
  //initally show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegPage(onTap: togglePages);
    }
  }
}
