import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:milma_food_ordering/provider/cartProvider.dart';
import 'package:milma_food_ordering/screens/cart.dart';
import 'package:milma_food_ordering/screens/home_page.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';
import 'package:milma_food_ordering/screens/paymentPage.dart';
import 'package:milma_food_ordering/screens/order_placed.dart';
import 'package:milma_food_ordering/screens/paymentPage.dart';
import 'package:milma_food_ordering/screens/product_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Utils.messengerKey,
          title: 'Milma Food Ordering App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            fontFamily: "OpenSans",
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: 'homepage',
          routes: {
            'SignInPage': (context) => signInStless(),
            //'productpage': (context) => const ProductPage(),
            'homepage': (context) => HomePage(),
            CartPage.routeName: (context) => CartPage(),
            ProductPage.routeName: (context) => const ProductPage(),
            'payment': (context) => const PaymentP(),
            'order-confirmation': (context) => OrderPlacedSplash(),
          }
          //   home: Scaffold(
          //     backgroundColor: Colors.blue.shade50,
          //     body: Padding(
          //       padding: EdgeInsets.all(30),
          //       child: StreamBuilder<User?>(
          //         stream: FirebaseAuth.instance.authStateChanges(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           }
          //           if (snapshot.hasError) {
          //             return Center(
          //               child: Text('Something went wrong'),
          //             );
          //           }
          //           if (snapshot.hasData) {
          //             WidgetsBinding.instance.addPostFrameCallback((_) {
          //               Navigator.pop(context);
          //               Navigator.pushNamed(context, 'homepage');
          //             });
          //             return Container();
          //           } else {
          //              WidgetsBinding.instance.addPostFrameCallback((_) {
          //               Navigator.pop(context);
          //             Navigator.pushNamed(context, 'SignInPage');
          //             });
          //             return Container();
          //           }
          //         },
          //       ),
          //     ),
          //   ),
          ),
    );
  }
}
