import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class signIn extends StatefulWidget {
//   const signIn({super.key});

//   @override
//   State<signIn> createState() => _signInState();
// }

class signInStless extends StatelessWidget {
  ValueNotifier userCredential = ValueNotifier('');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  signInStless({super.key});

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // TODO
      print('exception->$e');

      Utils.showSnackBar(e.toString());
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: signInFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sign In',
              style: GoogleFonts.lato(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 21, 39, 77),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Sign In icon
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(35)),
                  ),
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                      onPressed: () async {
                        userCredential.value = await signInWithGoogle();
                        if (userCredential.value != null) {
                          print(userCredential.value.user!.email);
                          Navigator.pop(context);
                  Navigator.pushNamed(context, 'homepage');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/image/google_icon.png',
                            width: 80,
                            height: 70,
                          ),
                          Text(
                            'Continue with Google',
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 21, 39, 77),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _signInState extends State<signIn> {
//   ValueNotifier userCredential = ValueNotifier('');
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();

//     super.dispose();
//   }

//   // Method to signIn the user with given credentials
//   void _signIn() async {
//     // Loding Indicator while signUp is processing
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Center(
//               child: CircularProgressIndicator(),
//             ));

//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//       print('User signed in successfully!');
//     } on FirebaseAuthException catch (e) {
//       print('Error during sign-in: $e');

//       Utils.showSnackBar(e.message);
//     }

//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }

// // Method for google SignIn

//   Future<dynamic> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       // TODO
//       print('exception->$e');

//       Utils.showSnackBar(e.toString());
//     }
//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: signInFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Sign In',
//             style: GoogleFonts.lato(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: const Color.fromARGB(255, 21, 39, 77),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Google Sign In icon
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(35)),
//                 ),
//                 child: Center(
//                   child: TextButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.transparent),
//                     ),
//                     onPressed: () async {
//                       userCredential.value = await signInWithGoogle();
//                       if (userCredential.value != null) {
//                         print(userCredential.value.user!.email);
//                       }
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           'assets/image/google_icon.png',
//                           width: 80,
//                           height: 70,
//                         ),
//                         Text(
//                           'Continue with Google',
//                           style: GoogleFonts.lato(
//                             color: const Color.fromARGB(255, 21, 39, 77),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }















































// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   static const routeName = '/login';
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
