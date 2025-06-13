import 'package:flutter/material.dart';
import 'package:tokoonline/screen/SingUP.dart';
import 'package:tokoonline/screen/login.dart';
import 'package:tokoonline/screen/home.dart'; // Pastikan file ini ada

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool showLogin = true;

  void toggle() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home_Screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login_Screen(toggle, onLoginSuccess: navigateToHome);
    } else {
      return SignUp_Screen(toggle, onSignUpSuccess: navigateToHome);
    }
  }
}
