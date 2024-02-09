import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/utils/utils.dart';
import 'package:milma_food_ordering/widgets/round_button.dart';

import '../../widgets/round_textField.dart';

final _formKey = GlobalKey<FormState>();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DFE7F6"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Give a quick Intro...!',
                    style: GoogleFonts.cookie(
                      textStyle: TextStyle(
                        color: HexColor("#120791"),
                        fontSize: 44,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                CircleAvatar(
                  backgroundColor: HexColor("#15274B"),
                  radius: 101.5,
                  child: const Image(
                      image: AssetImage("assets/image/icon-user.png")),
                ),
                const SizedBox(height: 50),
                const RoundTextField(
                  hintText: 'Full Name',
                  textInputAction: TextInputAction.next,
                  validator: validateName,
                ),
                const SizedBox(height: 14),
                const RoundTextField(
                  hintText: 'Roll number',
                  textInputAction: TextInputAction.next,
                  validator: validateRollNumber,
                ),
                const SizedBox(height: 14),
                const RoundTextField(
                  hintText: 'Hostel Name',
                  textInputAction: TextInputAction.next,
                  validator: validateHostelName,
                ),
                const SizedBox(height: 14),
                const RoundTextField(
                  hintText: 'Mobile Number',
                  textInputAction: TextInputAction.next,
                  validator: validateNumber,
                ),
                const SizedBox(
                  height: 26,
                ),
                // const Expanded(
                const SizedBox(
                  width: 330,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundButton(text: 'Clear'),
                      RoundButton(text: 'Go'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* icon-user */
