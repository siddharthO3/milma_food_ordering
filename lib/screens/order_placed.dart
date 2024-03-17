import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:milma_food_ordering/screens/product_page.dart';

class OrderPlacedSplash extends StatefulWidget {
  @override
  State<OrderPlacedSplash> createState() => _OrderPlacedSplashState();
}

class _OrderPlacedSplashState extends State<OrderPlacedSplash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff15274B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/amination/Animation - 1707913036795.json',
              height: 300,
              reverse: false,
              repeat: false,
            ),
            Container(
              margin: const EdgeInsets.only(top: 11),
              child: const Center(
                child: Text(
                  "Order Placed!",
                  style: TextStyle(
                      fontSize: 61,
                      fontFamily: 'Cookie',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
