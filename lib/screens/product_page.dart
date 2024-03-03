import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';

  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  var amt = "0" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: true
                  ? const Icon(Icons.star)
                  : Icon(Icons.star_border, key: ValueKey(true)),
            ),
          )
        ],
      ),
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'image', // Set a tag for Hero animation
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.network(
                    "https://t4.ftcdn.net/jpg/05/67/61/35/360_F_567613544_uTYWtyPLgKlWBbuGMPXtCEAa1y0MvJbL.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  "Chicken Burger",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 18.0,
                    ),
                    Text(
                      " 20 minutes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    TwoTextButton(
                      text1: 'Half',
                      text2: '₹60',
                      color1: color1,
                      color2: Colors.white,
                      onPressed: () {
                        setState(() {
                          color2 = Colors.white;
                          color1 = color1 == Colors.white ? Colors.deepPurpleAccent : Colors.white;
                          amt = "60" ;
                        });
                      },
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    TwoTextButton(
                      text1: 'Full',
                      text2: '₹100',
                      color1: color2,
                      color2: Colors.white,
                      onPressed: () {
                        setState(() {
                          color1 = Colors.white;
                          color2 = color2 == Colors.white ? Colors.deepPurpleAccent : Colors.white;
                          amt = "100" ;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.deepPurpleAccent[100],
                padding: EdgeInsets.fromLTRB(4, 28, 4, 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Text(
                        'Amount : $amt' ,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    customStyledButton(
                      text: "Buy",
                      textColor: Colors.white,
                      color: Colors.black,
                      borderColor: Colors.black,
                      onPressed: () {
                        // Add logic for Buy button
                      },
                    ),
                    customStyledButton(
                      text: "Add to Cart",
                      textColor: Colors.black,
                      color: Colors.transparent,
                      borderColor: Colors.black,
                      onPressed: () {
                        // Add logic for Add to Cart button
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget TwoTextButton({
  required String text1,
  required String text2,
  required Color color1,
  required Color color2,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 150, // Adjust width as needed
      height: 75, // Adjust height as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Add border
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: color1,
                border: Border(
                  bottom: BorderSide(color: Colors.black), // Border for the bottom side
                ),),

              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 5, // Add separator width
            color: Colors.red, // Add separator color
          ),
          Expanded(
            child: Container(
              color: color2,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget customStyledButton({
  required String text,
  required Color color,
  required Color borderColor,
  required Color textColor,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Text color
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
