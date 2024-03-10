import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milma_food_ordering/provider/cartProvider.dart';
import 'package:milma_food_ordering/screens/order_placed.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/';
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<String> productName = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  //   'Item 6',
  //   'Item 7',
  //   'Item 8',
  //   'Item 9',
  //   'Item 10'
  // ];

  // List<int> quantities = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

  // List<double> prices = [100, 50, 120, 80, 45, 35, 60, 70, 110, 35];

  // List<String> images = ['img1', 'img2', 'img3', 'img4', 'img5'];

  // void incrementQty(int index) {
  //   setState(() {
  //     quantities[index]++;
  //   });
  // }

  // void decrementQty(int index) {
  //   setState(() {
  //     if (quantities[index] > 0) {
  //       quantities[index]--;
  //     }
  //   });
  // }

  // double getCartTotal() {
  //   double total = 0;

  //   for (int i = 0; i < productName.length; i++) {
  //     total += quantities[i] * prices[i];
  //   }

  //   return total;
  // }

  void showDialogBoxOnProceed() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Unable to Proceed'),
            content: const Text("Nothing in Cart!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "CART",
              style: TextStyle(color: Color(0xff15274B)),
            ),
            centerTitle: true,
            shadowColor: Colors.black87,
            elevation: 2),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: ((context, index) {
                          final cartItem = cartProvider.cartItems[index];
                          return Dismissible(
                            key: Key(cartItem.productName),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                // productName.removeAt(index);
                                cartProvider.decrementQty(index);
                              });
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(11)),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                    right: 16,
                                    top: 5,
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        width: 60,
                                        color: Colors.greenAccent,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 7),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItem.productName,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 34,
                                                  width: 34,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(7),
                                                              bottomLeft: Radius
                                                                  .circular(7)),
                                                      border: Border.all(
                                                          width: 0.1,
                                                          color: Colors.grey)),
                                                  child: Center(
                                                    child: IconButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        cartProvider
                                                            .decrementQty(
                                                                index);
                                                        if (cartProvider
                                                                .cartItems[
                                                                    index]
                                                                .quantity ==
                                                            0) {
                                                          setState(() {
                                                            //   cartProvider.cartItems[index].quantity.removeAt(
                                                            //       index);
                                                            //   cartProvider.cartItems[index].productName
                                                            //       .removeAt(
                                                            //           index);
                                                            //  cartProvider.cartItems[index].price.removeAt(
                                                            //       index);
                                                            cartProvider
                                                                .cartItems
                                                                .removeAt(
                                                                    index);
                                                            ;
                                                          });
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.remove),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 34,
                                                  width: 34,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.1,
                                                          color: Colors.grey)),
                                                  child: Center(
                                                    child: Text(
                                                      cartProvider
                                                          .cartItems[index]
                                                          .quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 34,
                                                  width: 34,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topRight: Radius
                                                                  .circular(7),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                  child: Center(
                                                    child: IconButton(
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        cartProvider
                                                            .incrementQty(
                                                                index);
                                                      },
                                                      icon:
                                                          const Icon(Icons.add),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '\u{20B9} ' +
                                            cartProvider.cartItems[index].price
                                                .toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                )
                              ],
                            ),
                          );
                        }))),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cart Total',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            '\u{20B9} ' +
                                cartProvider.getCartTotal().toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if (cartProvider.getCartTotal() != 0) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPlacedSplash(),
                              ),
                            );
                          } else {
                            cartProvider.showDialogBoxOnProceed(context);
                          }
                          cartProvider.clearCart();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff15274B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        child: const Text(
                          'Proceed To Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
