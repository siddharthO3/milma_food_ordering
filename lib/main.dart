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
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: "OpenSans",
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 248, 221),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductCard(),
    );
  }
}

// Placeholder Text for the item widgets
final String imageURI = "assets/image/food.jpg";
final String itemName = "Item Name";
final String expectedTime = "10 mins";
final double price = 99.9;

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
          title: Text('Milma Store'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommened for you",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all >",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Item Widget
            ItemsRow(_itemsList),
          ],
        ));
  }
}
