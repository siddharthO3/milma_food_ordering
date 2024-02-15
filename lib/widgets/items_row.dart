import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/items.dart';

class ItemsRow extends StatefulWidget {
  final List<Items> itemsList;
  final String leftText;
  final String rightText;
  const ItemsRow(
      {required this.itemsList,
      super.key,
      required this.leftText,
      this.rightText = ""});

  @override
  State<ItemsRow> createState() => _ItemsRowState();
}

class _ItemsRowState extends State<ItemsRow> {
  IconData isFavoriteIcon = Icons.favorite_border;
  var isFavoriteColor = Colors.white;
  bool isClickedAgain = false;
  void _handleFavorite(Items item) async {
    setState(() {
      if (!isClickedAgain) {
        isFavoriteIcon = Icons.favorite;
        isFavoriteColor = Colors.red;
      } else {
        isFavoriteIcon = Icons.favorite_border;
        isFavoriteColor = Colors.white;
      }
      isClickedAgain = !isClickedAgain;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.leftText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.rightText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.itemsList.map((item) {
                  return Container(
                    width: 300,
                    height: 270,

                    margin: const EdgeInsets.only(right: 16, top: 12),
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
                                    height: 140,
                                    child: Image.asset(
                                      item.imageURI!,
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
                                  backgroundColor:
                                      const Color.fromARGB(149, 0, 0, 0),
                                  child: IconButton(
                                    onPressed: () => _handleFavorite(item),
                                    icon: Icon(isFavoriteIcon),
                                    style: IconButton.styleFrom(
                                      foregroundColor: isFavoriteColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        // Info Section----------------------------------------
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.itemName!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Expected Time: ${item.expectedTime!}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rs. ${item.price!}/-',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ), // Function to add to cart
                                    child: const Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
