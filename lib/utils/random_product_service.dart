import 'dart:math';
import '../models/product_model.dart';
import '../services/product_service_file_local.dart';

class RandomProductService {
  final ProductServiceFileLocal _productServiceFile = ProductServiceFileLocal();
  final Random _random = Random();

  Future<List<Product>> getRandomItems(int count) async {
    final products = await _productServiceFile.fetchProducts();
    if (products.length <= count) {
      return products; // Return all if there are not enough products
    }

    List<Product> randomItems = [];
    for (int i = 0; i < count; i++) {
      Product randomProduct = products[_random.nextInt(products.length)];
      randomItems.add(randomProduct);
    }
    return randomItems;
  }

  Future<Product> getSingleRandomItem() async {
    final products = await _productServiceFile.fetchProducts();
    return products[_random.nextInt(products.length)];
  }
}
