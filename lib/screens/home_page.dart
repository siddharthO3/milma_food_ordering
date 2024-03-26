// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milma_food_ordering/screens/cart.dart';
import '../models/items.dart';
import '../widgets/items_row.dart';
import '../core/backend_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milma_food_ordering/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  // Placeholder Text for the item widgets
  static const String imageURI = "assets/image/food.jpg";
  static const String itemName = "Item Name";
  static const String expectedTime = "10 mins";
  static const double price = 99.9;

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  //Sample list for item widget
  final List<Items> _itemsList = BackendManager().TEST_ITEMS;
  final List<Items> favorites = [];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      // child:
     return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              label: 'Menu',
              selectedIcon: Icon(Icons.home, color: Colors.blue),
              icon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: "Favorites",
              selectedIcon: Icon(Icons.favorite, color: Colors.blue),
              icon: Icon(Icons.favorite),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person, color: Colors.blue),
              label: "Profile",
            )
          ],
        ),
        body: <Widget>[
          /// Home page
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // This ensures the Column doesn't expand beyond its children.
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Search bar
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.0),
                                hintText: "Search for food",
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          //cart icon
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CartPage()));
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Item Widget
                    ItemsRow(
                      leftText: "Favorites",
                      itemsList: _itemsList,
                    ),
                    ItemsRow(
                      leftText: "Combos",
                      itemsList: _itemsList,
                    ),
                    ItemsRow(
                      leftText: "Meals",
                      itemsList: _itemsList,
                    ),
                    ItemsRow(
                      leftText: "Beverages",
                      itemsList: _itemsList,
                    ),
                    ItemsRow(
                      leftText: "Snacks",
                      itemsList: _itemsList,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Favorites page
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  'Favorites page',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),

          /// Profile page
          Center(
            child: Card(
              shadowColor: Colors.transparent,
              margin: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Profile page',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Welcome '),
                          const SizedBox(
                            width: 5,
                          ),
                          // Text(user!.email!),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            try {
                              cartProvider.clearCart();
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'SignInPage');
                            } catch (e) {
                              print('{$e}Cant sign out');
                            }
                            // Navigator.pushReplacementNamed(context, 'authP');
                          },
                          icon: Icon(Icons.logout_outlined),
                          label: const Text('Sign Out')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ][currentPageIndex],
      );
    });
  }
}
