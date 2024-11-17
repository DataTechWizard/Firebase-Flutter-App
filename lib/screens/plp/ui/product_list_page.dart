import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../services/firebase_event_handler_service.dart'; // Import FirebaseEventHandlerService
import '../../../services/product_service_api.dart';
import '../../../services/product_service_file_local.dart';
import '../../../di/injection.dart'; // Import for dependency injection setup

class ProductListPage extends StatelessWidget {
  final ProductServiceApi _productServiceApi;
  final ProductServiceFileLocal _productServiceFile;
  final FirebaseEventHandlerService _eventHandler;
  final bool useApi;

  // Constructor injection for dependencies
  ProductListPage({
    super.key,
    this.useApi = false, // Default value for `useApi`
    ProductServiceApi? productServiceApi,
    ProductServiceFileLocal? productServiceFile,
    FirebaseEventHandlerService? eventHandler,
  })  : _productServiceApi = productServiceApi ?? getIt<ProductServiceApi>(),
        _productServiceFile =
            productServiceFile ?? getIt<ProductServiceFileLocal>(),
        _eventHandler = eventHandler ?? getIt<FirebaseEventHandlerService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: useApi
            ? _productServiceApi.fetchProducts()
            : _productServiceFile.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading products: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final products = snapshot.data!;
            _eventHandler.handleEvent("view_item_list", products: products);

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
                      subtitle: Text(
                        '£${product.price?.toStringAsFixed(2) ?? 'N/A'}', // Null check for price
                      ),
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
                        _eventHandler.handleEvent(
                          "select_item",
                          product: product,
                        );
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
