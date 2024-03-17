import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/SBar.dart';

class signUp extends StatefulWidget {
  final VoidCallback onSIClick;

  const signUp(this.onSIClick, {Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  ValueNotifier userCredential = ValueNotifier('');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

// Method to signUp the user with given credentials
  void _signUp() async {
    final isValid =
        formkey.currentState!.validate(); // Return nothing for invalid input
    if (!isValid) return;
    // Loding Indicator while signUp is processing
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('User signed up successfully!');
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // Method for google SignIn

  Future<dynamic> signUpWithGoogle() async {
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
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Sign Up',
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 21, 39, 77),
            ),
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                height: 85,
                width: 85,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    iconSize: 30,
                    icon: Image.asset('assets/image/google_icon.png'),
                    onPressed: () async {
                      userCredential.value = await signUpWithGoogle();
                      if (userCredential.value != null) {
                        print(userCredential.value.user!.email);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Divider(
                thickness: 5,
                height: 5,
                color: Color.fromARGB(255, 21, 39, 77),
              ),
              Text(
                'or',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 21, 39, 77),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 5,
                height: 5,
                color: Color.fromARGB(255, 21, 39, 77),
              ),
            ],
          ),
          Column(
            // Text fields for EmailID, Password and re-entering password
            children: [
              TextFormField(
                controller: _emailController,
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
                    'Enter Your Mail Id',
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(90, 21, 39, 77),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: Color.fromARGB(90, 21, 39, 77),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter atleast 6 charecters'
                    : null,
                decoration: InputDecoration(
                  iconColor: Color.fromARGB(90, 21, 39, 77),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hoverColor: Color.fromARGB(90, 21, 39, 77),
                  label: Text(
                    'Enter Password',
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(90, 21, 39, 77),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color.fromARGB(90, 21, 39, 77),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     iconColor: Color.fromARGB(90, 21, 39, 77),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     hoverColor: Color.fromARGB(90, 21, 39, 77),
              //     label: Text(
              //       'Re-enter password',
              //       style: GoogleFonts.lato(
              //         color: Color.fromARGB(90, 21, 39, 77),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     prefixIcon: const Icon(
              //       Icons.remove_red_eye_outlined,
              //       color: Color.fromARGB(90, 21, 39, 77),
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account ? , ',
                style: GoogleFonts.lato(),
              ),
              GestureDetector(
                onTap: () {
                  widget.onSIClick();
                },
                child: Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 21, 39, 77),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: Text('Cancel'),
              ),
              OutlinedButton(
                onPressed: _signUp,
                child: Text(
                  'Next',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 21, 39, 77),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}














































// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   static const routeName = '/sign-up';
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
