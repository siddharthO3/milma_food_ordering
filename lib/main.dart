import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:milma_food_ordering/global.dart';
import 'package:milma_food_ordering/models/SBar.dart';
import 'package:milma_food_ordering/provider/cartProvider.dart';
import 'package:milma_food_ordering/screens/cart.dart';
import 'package:milma_food_ordering/screens/home_page.dart';
import 'package:milma_food_ordering/screens/login/signinP.dart';
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
          initialRoute: 'cartPage',
          // home: CartPage(), 
          routes: {
            'SignInPage': (context) => signInStless(),
            //'productpage': (context) => const ProductPage(),
            'homepage': (context) => HomePage(),
            'cartPage': (context) => CartPage(),
            ProductPage.routeName: (context) => const ProductPage(),
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

// import 'package:flutter/material.dart';
// import 'package:upi_india/upi_india.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test UPI',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;

//   TextStyle header = TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   );

//   TextStyle value = TextStyle(
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//   );


//   // UpiApp app = UpiApp.googlePay;
//   @override
//   void initState() {
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       apps = [];
//     });
//     super.initState();
//   }



//   Future<UpiResponse> initiateTransaction(UpiApp app) async {
//     return _upiIndia.startTransaction(
//       app: app,
//       receiverUpiId: "9078600498@ybl",
//       receiverName: 'Md Azharuddin',
//       transactionRefId: 'TestingUpiIndiaPlugin',
//       transactionNote: 'Not actual. Just an example.',
//       amount: 1.00,
//     );
//   }

//   Widget displayUpiApps() {
//     if (apps == null)
//       return Center(child: CircularProgressIndicator());
//     else if (apps!.length == 0)
//       return Center(
//         child: Text(
//           "No apps found to handle transaction.",
//           style: header,
//         ),
//       );
//     else
//       {// ignore: curly_braces_in_flow_control_structures
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap: () {
//                   _transaction = initiateTransaction(app);
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.memory(
//                         app.icon,
//                         height: 60,
//                         width: 60,
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//   }
//   }

//   String _upiErrorHandler(error) {
//     switch (error) {
//       case UpiIndiaAppNotInstalledException:
//         return 'Requested app not installed on device';
//       case UpiIndiaUserCancelledException:
//         return 'You cancelled the transaction';
//       case UpiIndiaNullResponseException:
//         return 'Requested app didn\'t return any response';
//       case UpiIndiaInvalidParametersException:
//         return 'Requested app cannot handle the transaction';
//       default:
//         return 'An Unknown error has occurred';
//     }
//   }

//   void _checkTxnStatus(String status) {
//     switch (status) {
//       case UpiPaymentStatus.SUCCESS:
//         print('Transaction Successful');
//         break;
//       case UpiPaymentStatus.SUBMITTED:
//         print('Transaction Submitted');
//         break;
//       case UpiPaymentStatus.FAILURE:
//         print('Transaction Failed');
//         break;
//       default:
//         print('Received an Unknown transaction status');
//     }
//   }

//   Widget displayTransactionData(title, body) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$title: ", style: header),
//           Flexible(
//               child: Text(
//             body,
//             style: value,
//           )),
//         ],
//       ),
//     );
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('UPI'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: displayUpiApps(),
// //           ),
// //           Expanded(
// //             child: FutureBuilder(
// //               future: _transaction,
// //               builder:
// //                   (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.done) {
// //                   if (snapshot.hasError) {
// //                     return Center(
// //                       child: Text(
// //                         _upiErrorHandler(snapshot.error.runtimeType),
// //                         style: header,
// //                       ), // Print's text message on screen
// //                     );
// //                   }

// //                   // If we have data then definitely we will have UpiResponse.
// //                   // It cannot be null
// //                   UpiResponse _upiResponse = snapshot.data!;

// //                   // Data in UpiResponse can be null. Check before printing
// //                   String txnId = _upiResponse.transactionId ?? 'N/A';
// //                   String resCode = _upiResponse.responseCode ?? 'N/A';
// //                   String txnRef = _upiResponse.transactionRefId ?? 'N/A';
// //                   String status = _upiResponse.status ?? 'N/A';
// //                   String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
// //                   _checkTxnStatus(status);

// //                   return Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: <Widget>[
// //                         displayTransactionData('Transaction Id', txnId),
// //                         displayTransactionData('Response Code', resCode),
// //                         displayTransactionData('Reference Id', txnRef),
// //                         displayTransactionData('Status', status.toUpperCase()),
// //                         displayTransactionData('Approval No', approvalRef),
// //                       ],
// //                     ),
// //                   );
// //                 } else {
// //                   return const Center(
// //                     child: Text(''),
// //                   );
// //                 }
// //               },
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
