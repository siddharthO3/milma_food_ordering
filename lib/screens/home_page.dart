import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/items.dart';
import '../widgets/items_row.dart';

class NavigateHome {
  homescreen(BuildContext context) {
    Navigator.pushNamed(context, 'homepage');
  }
}

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  static const routeName = '/';
  // Placeholder Text for the item widgets
  static const String imageURI = "assets/image/food.jpg";
  static const String itemName = "Item Name";
  static const String expectedTime = "10 mins";
  static const double price = 99.9;
  //Sample list for item widget
  final List<Items> _itemsList = [
    Items(
      imageURI: imageURI,
      itemName: itemName,
      expectedTime: expectedTime,
      price: price,
    ),
    Items(
      imageURI: imageURI,
      itemName: itemName,
      expectedTime: expectedTime,
      price: price,
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Milma Store'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended for you",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all >",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Item Widget
              ItemsRow(_itemsList),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome '),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(user.email!),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
              // Navigator.pushReplacementNamed(context, 'authP');
                  },
                  icon: Icon(Icons.logout_outlined),
                  label: const Text('Sign Out')),
            ],
          ),
        ));
  }
}
