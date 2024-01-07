import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Item extends StatefulWidget {
  const Item(
      this.url, this.name, this.pickup, this.rating, this.raters, this.price,
      {super.key});
  final String? url;
  final String? name;
  final DateTime? pickup;
  final double rating;
  final int raters;
  final double? price;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // children: itemsList.map((item) {
      children: [
        Container(
          width: 300,
          //height: 225,

          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(24, 0, 0, 0),
                spreadRadius: 4,
                blurRadius: 5,
              )
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(40),
          ),

          //Content inside each Item Box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Image section----------------------------------------
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 105,
                          child: Image.asset(
                            widget.url!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.bottomLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(0, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(149, 0, 0, 0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Info Section----------------------------------------
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Expected Day & Time: ${DateFormat.Md().add_jm().format(widget.pickup!)}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.rating.toString(),
                          style: GoogleFonts.lato(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '|',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.raters.toString(),
                          style: GoogleFonts.lato(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${widget.price.toString()}/-',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {}, // Function to add to cart
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                          child: const Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
