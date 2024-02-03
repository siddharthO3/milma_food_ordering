import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milma_food_ordering/authP.dart';
import 'package:milma_food_ordering/screens/home_page.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';
import 'package:milma_food_ordering/screens/login/verifymailP.dart';

class launcher extends StatefulWidget {
  const launcher({super.key});

  @override
  State<launcher> createState() => _launcherState();
}

class _launcherState extends State<launcher> {
  Widget? currentScreen;
  String? name;

  // void onSignUptap() {
  //   setState(() {
  //     currentScreen = signIn();
  //   });
  // }

  // void onSignIntap() {
  //   setState(() {
  //     currentScreen = signUp();
  //   });
  // }

  // @override
  // void initState() {
  //   currentScreen = const signUp();
  //   super.initState();
  //   osut = onSignUptap;
  //   osit = onSignIntap;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
       scaffoldMessengerKey: Utils.messengerKey,
      //   initialRoute: '/',
      // routes: {
      //   '/': (context) => signIn.signInWithCallback(() {}),
      //   // Other routes if needed
      // },
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
                  return verifyEmailP();
                } else {
                  return  AuthPage();
                }
              }),
        ),
      ),
    );
  }
}