import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/items.dart';

class BackendManager {
  Future<void> sendPostRequest(
      {required Map<String, Object> data, required String endpoint}) async {
    final apiUrl = Uri.parse("https://jsonplaceholder.typicode.com$endpoint");

    var response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      print("Post created successfully!");
    } else {
      print("Failed to create post!");
    }
  }

  Future getItems() async {
    final apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Failed to fetch data!");
    }
  }

  final List<Items> TEST_ITEMS = [
    Items(
      imageURI: "assets/image/food.jpg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
    ),
    Items(
      imageURI: "assets/image/food.jpg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
    ),
  ];
}
