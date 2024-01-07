import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milma_food_ordering/Data/itemsData.dart';
import 'package:milma_food_ordering/Models/searchBar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final TextEditingController _searchController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final len = itemW.length;
    final List list1 = getShuffledItems();
    final List list2 = getShuffledItems();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 228, 228),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Milma Food App',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              const SizedBox(
                width: 45,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 24,
                  color: Colors.white,
                ),
                label: const Text(''),
              )
            ],
          ),
        ),
        
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const searchBar(),
                const SizedBox(
                  height: 20,
                ),
                Text( 
                  'Recomendations for You',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                  
                ),
                const SizedBox(
                  height: 20,
                ),
                   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < len; i++) ...[
                          itemW[i],
                          const SizedBox(
                            width: 15,
                          ),
                        ]
                      ],
                    ),
                  ),
                
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Today's Specials",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                
                   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < len; i++) ...[
                          list1[i],
                          const SizedBox(
                            width: 15,
                          ),
                        ]
                      ],
                    ),
                  ),
               
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Pick-up Tommorow',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),

                 SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < len; i++) ...[
                          list2[i],
                          const SizedBox(
                            width: 15,
                          ),
                        ]
                      ],
                    ),
                  ),
                
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(150, 183, 179, 179),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.find_in_page_rounded,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
