import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/screens/home_page.dart';
import 'package:milma_food_ordering/models/SBar.dart';

class verifyEmailP extends StatefulWidget {
  const verifyEmailP({super.key});

  @override
  State<verifyEmailP> createState() => _verifyEmailPState();
}

class _verifyEmailPState extends State<verifyEmailP> {
  bool isEmailVerified = false;
  Timer? timer;

  Future sendVerificationMail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationMail();

      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      : Container(
        child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Resend verification mail',style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 21, 39, 77),
                      fontWeight: FontWeight.bold,),),
                      SizedBox(height: 7,),
                  ElevatedButton.icon(
                      onPressed: () {
                        sendVerificationMail();
                      },
                      icon: Icon(Icons.mail_outline),
                      label: Text(
                        'Re-Send link',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 21, 39, 77),
                          fontSize: 15,
                        ),
                      )),
                      SizedBox(height: 7,),
                      ElevatedButton.icon(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(Icons.cancel_outlined),
                      label: Text(
                        'Cancel',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 21, 39, 77),
                          fontSize: 15,
                        ),
                      ))
                ],
              ),
          ),
      );
}