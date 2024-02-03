import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';

class forgotPasswordP extends StatefulWidget {
  const forgotPasswordP({super.key});

  @override
  State<forgotPasswordP> createState() => _forgotPasswordPState();
}

class _forgotPasswordPState extends State<forgotPasswordP> {

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Password reset email sent');

       Navigator.of(context).popUntil((route) => route.isFirst);
       //navigatorKey.currentState!.popUntil((route) => route.isFirst);
      //Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Reset Password',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 21, 39, 77),
            fontSize: 15,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key:forgotPasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' reset your password',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 21, 39, 77),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                  decoration: InputDecoration(
                    iconColor: Color.fromARGB(90, 21, 39, 77),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hoverColor: Color.fromARGB(90, 21, 39, 77),
                    label: Text(
                      'Enter Your Mail Id to recive reset link',
                      style: GoogleFonts.lato(
                        color: Color.fromARGB(90, 21, 39, 77),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.person_outline_outlined,
                      color: Color.fromARGB(90, 21, 39, 77),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      resetPassword();
                    },
                    icon: Icon(Icons.mail_outline),
                    label: Text(
                      'Send link',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 21, 39, 77),
                        fontSize: 15,
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}