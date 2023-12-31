import 'package:flutter/material.dart';
import 'items.dart';

class ItemsRow extends StatelessWidget {
  final List<Items> itemsList;
  ItemsRow(this.itemsList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: itemsList.map((item) {
              return Container(
                width: 300,
                //height: 225,

                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
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
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(0, 255, 255, 255),
                                      const Color.fromARGB(255, 255, 255, 255),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(149, 0, 0, 0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border),
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
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.itemName!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Expected Time: ${item.expectedTime!}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs. ${item.price!}/-',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {}, // Function to add to cart
                                child: Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
