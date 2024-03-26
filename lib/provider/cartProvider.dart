import 'package:flutter/material.dart';
import 'package:milma_food_ordering/models/cartModel.dart';

class CartProvider extends ChangeNotifier {
  List<cartModel> cartItems = [
    cartModel(price: 100, productName: 'Item 1', quantity: 1),
    cartModel(price: 70, productName: 'Item 2', quantity: 1),
    cartModel(price: 60, productName: 'Item 3', quantity: 1),
    cartModel(price: 50, productName: 'Item 4', quantity: 1),
  ];

  void showDialogBoxOnProceed(BuildContext context) {
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
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  void incrementQty(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQty(int index) {
    if (cartItems[index].quantity > 0) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }

  double getCartTotal() {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].quantity * cartItems[i].price;
    }
    return total;
  }

  void clearCart() {
    for (int i = 0; i < cartItems.length; i++) {
      cartItems[i].quantity = 0;
      // cartItems.removeAt(i);
    }
      notifyListeners();
  }

  List<String> getProductNames() {
    List<String> names = [];
    for (int i = 0; i < cartItems.length; i++) {
      names.add(cartItems[i].productName);
    }
    return names;
  }

  List<double> getPrices() {
    List<double> prices = [];
    for (int i = 0; i < cartItems.length; i++) {
      prices.add(cartItems[i].price);
    }
    return prices;
  }
}
