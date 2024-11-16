import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/product_model.dart'; // Adjust this import based on your directory structure
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductServiceFileLocal {
  final String filePath = 'lib/data/products.json';

  Future<List<Product>> fetchProducts() async {
    try {
      // Load the JSON file as a string
      final String jsonString = await rootBundle.loadString(filePath);

      // Decode the JSON string into a list of dynamic objects
      List<dynamic> data = jsonDecode(jsonString);

      // Map each dynamic object to a Product instance
      return data.map((item) => Product.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load products from file: $e');
    }
  }
}
