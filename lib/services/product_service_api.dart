import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductServiceApi {
  final String apiUrl = 'http://x.x.x.x:8181/products'; //Can Use Wiremock

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
