import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentP extends StatefulWidget {
  const PaymentP({super.key});
  static const routeName = '/';
  
  @override
  State<PaymentP> createState() => _PaymentPState();
}

class _PaymentPState extends State<PaymentP> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 39, 75),
        title: Text(
          'Payment Methods',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 7, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset position
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.alternate_email),
                    Text(
                      'UPI ID',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Checkbox(
                      value: _checkbox1,
                      onChanged: (value) {
                        setState(() {
                          _checkbox1 = value!;
                          _checkbox2 = false;
                          _checkbox3 = false;
                        });
                      },
                    ),
                  ]),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 7, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset position
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.credit_card),
                    Text(
                      'Credit / Debit Card',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Checkbox(
                      value: _checkbox2,
                      onChanged: (value) {
                        setState(() {
                          _checkbox2 = value!;
                          _checkbox1 = false;
                          _checkbox3 = false;
                        });
                      },
                    ),
                  ]),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 7, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset position
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.account_balance),
                    Text(
                      'Credit / Debit Card',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Checkbox(
                      value: _checkbox3,
                      onChanged: (value) {
                        setState(() {
                          _checkbox3 = value!;
                          _checkbox1 = false;
                          _checkbox2 = false;
                        });
                      },
                    ),
                  ]),
            ),
            Spacer(),
            OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 21, 39, 75), // Set background color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        side: BorderSide.none, // Remove border side
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Text(
          'Proceed to pay',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    ),
    SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
