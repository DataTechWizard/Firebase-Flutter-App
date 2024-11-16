class Product {
  final String itemId;
  final String itemName;
  final String? itemCategory;
  final String? itemVariant;
  final String? itemBrand;
  final String? itemMrc;
  final num? itemPlanLength;
  final num? itemStock;
  final String? itemLocation;
  final num? price;
  final String? currency;
  final String? imageUrl;
  final String? productType;
  final num? rating;
  final String? warrantyPeriod;
  final bool? is5GCapable;
  final num? releaseYear;
  final String? colour;
  final String? dimensions;
  final String? weight;

  // Additional fields for AnalyticsEventItem conversion
  final String? affiliation;
  final String? coupon;
  final num? discount;
  final int? index;
  final String? itemListId;
  final String? itemListName;
  final String? locationId;
  final String? promotionId;
  final String? promotionName;
  final int? quantity;

  Product({
    required this.itemId,
    required this.itemName,
    this.itemCategory,
    this.itemVariant,
    this.itemBrand,
    this.itemMrc,
    this.itemPlanLength,
    this.itemStock,
    this.itemLocation,
    this.price,
    this.currency,
    this.imageUrl,
    this.productType,
    this.rating,
    this.warrantyPeriod,
    this.is5GCapable,
    this.releaseYear,
    this.colour,
    this.dimensions,
    this.weight,
    this.affiliation,
    this.coupon,
    this.discount,
    this.index,
    this.itemListId,
    this.itemListName,
    this.locationId,
    this.promotionId,
    this.promotionName,
    this.quantity,
  });

  // Factory constructor for creating a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      itemId: json['itemId'] ?? '', // Default to empty string if null
      itemName: json['itemName'] ?? '',
      itemCategory: json['itemCategory'],
      itemVariant: json['itemVariant'],
      itemBrand: json['itemBrand'],
      itemMrc: json['itemMrc'],
      itemPlanLength: json['itemPlanLength'],
      itemStock: json['itemStock'],
      itemLocation: json['itemLocation'],
      price: json['price']?.toDouble(),
      currency: json['currency'],
      imageUrl: json['imageUrl'],
      productType: json['productType'],
      rating: json['rating']?.toDouble(),
      warrantyPeriod: json['warrantyPeriod'],
      is5GCapable: json['is5GCapable'],
      releaseYear: json['releaseYear'],
      colour: json['colour'],
      dimensions: json['dimensions'],
      weight: json['weight'],
      affiliation: json['affiliation'],
      coupon: json['coupon'],
      discount: json['discount'],
      index: json['index'],
      itemListId: json['itemListId'],
      itemListName: json['itemListName'],
      locationId: json['locationId'],
      promotionId: json['promotionId'],
      promotionName: json['promotionName'],
      quantity: json['quantity'],
    );
  }
}
