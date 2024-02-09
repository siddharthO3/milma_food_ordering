import 'package:flutter/material.dart';
import 'package:milma_food_ordering/screens/login/profile.dart';
import '../screens/cart_page.dart';
import '../screens/login/login.dart';
import '../screens/login/sign_up.dart';
import '../screens/login/welcome.dart';
import '../screens/product_page.dart';

import 'screens/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Milma Food Ordering App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: "OpenSans",
        // scaffoldBackgroundColor: const Color.fromARGB(255, 255, 248, 221),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ProfileScreen.routeName,
      routes: {
        WelcomeScreen.routeName:(context) => const WelcomeScreen(),
        LoginScreen.routeName:(context) => const LoginScreen(),
        SignUpScreen.routeName:(context) => const SignUpScreen(),
        ProfileScreen.routeName:(context)=> const ProfileScreen(),

        HomePage.routeName:(context) => HomePage(),
        ProductPage.routeName:(context) => const ProductPage(),
        CartPage.routeName: (context) => const CartPage(),
      },
    );
  }
}