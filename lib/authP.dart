import 'package:flutter/material.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';
import 'package:milma_food_ordering/screens/login/signupP.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? signIn(toogle) : signUp(toogle);

  void toogle() => setState(() {
        isLogin = !isLogin;
      });
}