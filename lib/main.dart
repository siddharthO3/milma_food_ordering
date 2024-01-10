import 'package:flutter/material.dart';
import 'Item_Widget/items_row.dart';
import 'Item_Widget/items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milma Food Ordering App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: "OpenSans",
        // scaffoldBackgroundColor: const Color.fromARGB(255, 255, 248, 221),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductCard(),
    );
  }
}

// Placeholder Text for the item widgets
const String imageURI = "assets/image/food.jpg";
const String itemName = "Item Name";
const String expectedTime = "10 mins";
const double price = 99.9;

class ProductCard extends StatelessWidget {
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
            ],
          ),
        ));
  }
}
