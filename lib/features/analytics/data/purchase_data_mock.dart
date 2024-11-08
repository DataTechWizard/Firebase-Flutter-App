import '../../../utils/utility_functions.dart';

const double itemsTotal = 899.99 + 59.99 + 199.99;
// Define fixed values for shipping and tax
const double shipping = 10.00; // Example shipping cost
final double tax = itemsTotal * 0.20; // Assuming a 20% VAT rate

// Calculate the final value including shipping and tax
final double value = itemsTotal + shipping + tax;

// Define additional purchase data
const String affiliation = "EE Online Store";
const String coupon = "SUMMER_SALE";

// Function to get the simulated API response for a purchase event
String getPurchaseApiResponse() {
  final String transactionId = generateRandomTransactionId();
  return '''
  {
    "transaction_id": "$transactionId",
    "affiliation": "$affiliation",
    "currency": "GBP",
    "value": "$value",
    "shipping": "$shipping",
    "tax": "$tax",
    "coupon": "$coupon",
    "items": [
      {
        "itemId": "MOB_006",
        "itemName": "Smartphone X",
        "itemCategory": "Mobile Phones",
        "itemVariant": "256GB Silver",
        "itemBrand": "BrandX",
        "itemMrc": "smartX-mrc",
        "itemPlanLength": 24,
        "itemStock": 10,
        "price": 899.99,
        "quantity": 1,
        "currency": "USD"
      },
      {
        "itemId": "GAD_003",
        "itemName": "Gaming Controller Pro",
        "itemCategory": "Gaming Accessories",
        "itemVariant": "Wireless Black",
        "itemBrand": "GameGear",
        "itemMrc": "controller-mrc",
        "itemPlanLength": 12,
        "itemStock": 25,
        "price": 59.99,
        "quantity": 2,
        "currency": "USD"
      },
      {
        "itemId": "ACC_002",
        "itemName": "Noise Cancelling Headphones",
        "itemCategory": "Audio Accessories",
        "itemVariant": "Over-Ear Blue",
        "itemBrand": "SoundPro",
        "itemMrc": "headphones-mrc",
        "itemPlanLength": 6,
        "itemStock": 40,
        "price": 199.99,
        "quantity": 1,
        "currency": "USD"
      }
    ]
  }
  ''';
}
