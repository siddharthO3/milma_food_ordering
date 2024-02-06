import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milma_food_ordering/authP.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:milma_food_ordering/screens/home_page.dart';
import 'package:milma_food_ordering/screens/login/forgotPasswordP.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';
import 'package:milma_food_ordering/screens/login/verifymailP.dart';
import 'package:milma_food_ordering/global.dart';

class launcher extends StatefulWidget {
  const launcher({Key? key});

  @override
  State<launcher> createState() => _launcherState();
}

class _launcherState extends State<launcher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      home: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: EdgeInsets.all(30),
          child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
              if (snapshot.hasData) {
                // Navigating to the 'homepage' route
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'homepage');
                  
                });
                // Return an empty container while navigating
                return Container();
              } else {
                return AuthPage();
              }
            },
          ),
        ),
      ),
      routes: {
        'homepage': (context) => HomePage(),
        'authpage': (context) => AuthPage(),
        'verifyEmailP': (context) => const verifyEmailP(),
      },
    );
  }
}
