//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:test_firebase_app/utils/analytics_utils.dart';
import '../../../services/product_service_api.dart';
import '../../../models/product_model.dart';
import '../../../services/analytics_service.dart';

class ProductListPage extends StatelessWidget {
  final ProductServiceApi productService = ProductServiceApi();
  final AnalyticsService analyticsService = AnalyticsService();

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: productService.fetchProducts(), // Fetch the product data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            analyticsService.logViewItemListEvent(products);

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final String imageUrl = product.imageUrl;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(product.itemName),
                      subtitle: Text('£${product.price}'),
                      leading: SizedBox(
                        width: 100, // Set desired width
                        height: 100, // Set desired height
                        child: imageUrl.startsWith('http')
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/default_image.png', // Use relative path
                                fit: BoxFit.cover,
                              ),
                      ),
                      onTap: () {
                        // Log the select item event
                        analyticsService.logSelectItemEvent(product);
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
