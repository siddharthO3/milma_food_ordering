import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final TextEditingController _searchController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    iconColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    label: Text(
                      'Search food Items',
                      style: GoogleFonts.lato(
                        color: const Color.fromRGBO(135, 179, 215, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.blue,
                      ),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search,
                          color: Colors.blue),
                    ),
                  ),
                );
  }
}