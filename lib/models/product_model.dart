class Product {
  final String itemId;
  final String itemName;
  final String itemCategory;
  final String itemVariant;
  final String itemBrand;
  final String itemMrc;
  final num itemPlanLength;
  final num itemStock;
  final String itemLocation;
  final num price;
  final String currency;
  final String imageUrl;
  final String productType;
  final num rating;
  final String warrantyPeriod;
  final bool is5GCapable;
  final num releaseYear;
  final String colour;
  final String dimensions;
  final String weight;

  Product({
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.itemVariant,
    required this.itemBrand,
    required this.itemMrc,
    required this.itemPlanLength,
    required this.itemStock,
    required this.itemLocation,
    required this.price,
    required this.currency,
    required this.imageUrl,
    required this.productType,
    required this.rating,
    required this.warrantyPeriod,
    required this.is5GCapable,
    required this.releaseYear,
    required this.colour,
    required this.dimensions,
    required this.weight,
  });

  // Factory constructor for creating a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      itemId: json['itemId'] ?? '', // If null, default to empty string
      itemName: json['itemName'] ?? '',
      itemCategory: json['itemCategory'] ?? '',
      itemVariant: json['itemVariant'] ?? '',
      itemBrand: json['itemBrand'] ?? '',
      itemMrc: json['itemMrc'] ?? '',
      itemPlanLength: json['itemPlanLength'] ?? 0, // Default to 0 if null
      itemStock: json['itemStock'] ?? 0,
      itemLocation: json['itemLocation'] ?? '',
      price: json['price']?.toDouble() ?? 0.0, // If null, default to 0.0
      currency: json['currency'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      productType: json['productType'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0, // If null, default to 0.0
      warrantyPeriod: json['warrantyPeriod'] ?? '',
      is5GCapable: json['is5GCapable'] ?? false, // Default to false if null
      releaseYear: json['releaseYear'] ?? 0,
      colour: json['colour'] ?? '',
      dimensions: json['dimensions'] ?? '',
      weight: json['weight'] ?? '',
    );
  }
}
