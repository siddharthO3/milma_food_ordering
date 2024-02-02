import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/Dashline.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:milma_food_ordering/screens/login/forgotPasswordP.dart';

class signIn extends StatefulWidget {
  const signIn(this.onSUClick, {super.key});
  final VoidCallback onSUClick;

  // Static method for creating instances of the signIn widget
  static signInWithCallback(VoidCallback onSUClick) {
    return signIn(onSUClick);
  }

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  ValueNotifier userCredential = ValueNotifier('');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // Method to signIn the user with given credentials
  void _signIn() async {
    // Loding Indicator while signUp is processing
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('User signed in successfully!');
    } on FirebaseAuthException catch (e) {
      print('Error during sign-in: $e');

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

// Method for google SignIn

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
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                height: 85,
                width: 85,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    iconSize: 30, // Decrease the icon size
                    icon: Image.asset('assets/image/google_icon.png'),
                    onPressed: () async {
                      userCredential.value = await signInWithGoogle();
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
              DashedLine(),
              Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  'or',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 21, 39, 77),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DashedLine(),
            ],
          ),
          Column(
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
                height: 15,
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
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const forgotPasswordP(),
                ),
              ),
              child: const Text('Forgot Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 21, 39, 77))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account ? ,  ',
                style: GoogleFonts.lato(),
              ),
              GestureDetector(
                onTap: () {
                  widget.onSUClick();
                },
                child: const Text('Sign-Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 21, 39, 77))),
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
                child: Text('clear'),
              ),
              OutlinedButton(
                onPressed: () {
                  _signIn();
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
