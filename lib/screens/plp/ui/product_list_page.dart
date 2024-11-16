import 'package:flutter/material.dart';
import '../../../services/product_service_api.dart';
import '../../../services/product_service_file_local.dart';
import '../../../models/product_model.dart';
import '../../../services/event_handler_service.dart'; // Import EventHandlerService

class ProductListPage extends StatelessWidget {
  final ProductServiceApi productServiceApi = ProductServiceApi();
  final ProductServiceFileLocal productServiceFile = ProductServiceFileLocal();
  final EventHandlerService eventHandler =
      EventHandlerService(); // Use EventHandlerService

  ProductListPage({super.key});

  // Toggle to choose between API and file-based data fetching
  final bool useApi =
      false; // Set to `true` to use API, `false` to use local file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        // Choose data source based on the toggle
        future: useApi
            ? productServiceApi.fetchProducts()
            : productServiceFile.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            // Log view item list event using EventHandlerService
            eventHandler.handleEvent("view_item_list", products: products);

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final String? imageUrl = product.imageUrl;

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
                        width: 100,
                        height: 100,
                        child: (imageUrl != null && imageUrl.startsWith('http'))
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/default_image.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                      onTap: () {
                        // Log select item event using EventHandlerService
                        eventHandler.handleEvent("select_item",
                            product: product);
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
