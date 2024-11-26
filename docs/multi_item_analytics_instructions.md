# Developer Note: Handling Multiple Items in Firebase Analytics Events

## Overview

In the `GAEcomAnalyticsEvents` class, the logic for handling multiple items in Firebase Analytics is implemented through methods such as `logViewItemListEvent`, `logViewCart`, `logBeginCheckout`, and `logPurchase`. These methods allow you to pass a **list of `Product` objects** (`List<Product>`) directly, and they handle the conversion and sending of multiple items in one call to Firebase Analytics. Below are instructions on how to properly achieve this.

## Step 1: Convert Products to CustomEventItem

The first step is to convert each `Product` into a `CustomEventItem` using the `_convertToAnalyticsEventItem(Product product)` helper method. This helper method maps the properties of each `Product` to the `CustomEventItem` class, which extends `AnalyticsEventItem` from Firebase. We extended `AnalyticsEventItem` to enable `@JsonSerializable()`, which allows seamless conversion between JSON and `CustomEventItem` objects. This makes it easy to work with lists of items and helps ensure compatibility with Firebase Analytics. The `parameters` field in `CustomEventItem` is also used to add any extra attributes (e.g., `itemStock`, `itemLocation`, etc.), ensuring that each `Product` is appropriately formatted for Firebase Analytics.

### Example Code for `_convertToAnalyticsEventItem`

```dart
CustomEventItem _convertToAnalyticsEventItem(Product product) {
  return CustomEventItem(
    itemId: product.itemId,
    itemName: product.itemName,
    itemCategory: product.itemCategory,
    itemVariant: product.itemVariant,
    itemBrand: product.itemBrand,
    price: product.price,
    currency: product.currency,
    affiliation: product.affiliation,
    coupon: product.coupon,
    discount: product.discount,
    index: product.index,
    itemListId: product.itemListId,
    itemListName: product.itemListName,
    locationId: product.locationId,
    promotionId: product.promotionId,
    promotionName: product.promotionName,
    quantity: product.quantity,
    parameters: {
      if (product.itemStock != null) 'item_stock': product.itemStock!,
      if (product.itemLocation != null && product.itemLocation!.isNotEmpty) 'item_location': product.itemLocation!,
      if (product.itemMrc != null && product.itemMrc!.isNotEmpty) 'item_mrc': product.itemMrc!,
    },
  );
}
```

## Step 2: Use Methods to Log Multiple Items

After converting each `Product` to a `CustomEventItem`, the next step is to use one of the provided methods (e.g., `logViewItemListEvent`, `logPurchase`) to send all items to Firebase Analytics in a single batch.

- **`List<Product>` Input**: These methods accept a list of `Product` objects. The list is mapped using `_convertToAnalyticsEventItem` to create a list of `CustomEventItem` objects.
- **Sending Items to Firebase**: Once the list is ready, it is passed to Firebase Analytics as the `items` parameter. This ensures multiple products are logged together without creating individual events for each one.

### Example Usage for Logging View Item List

```dart
Future<void> logViewItemListEvent(List<Product> products, String eventName) async {
  final items = products.map(_convertToAnalyticsEventItem).toList();
  const itemListId = "PLP_001";
  const itemListName = "Product List Page";

  await _analytics.logViewItemList(
    itemListId: itemListId,
    itemListName: itemListName,
    items: items,
  );
  _loggerService.logInfo(
    'Event Name: $eventName',
    items: items,
    eventParameters: {
      'itemListId': itemListId,
      'itemListName': itemListName,
    },
  );
}
```

## Step 3: Understanding `CustomEventItem`

The `CustomEventItem` class extends the base `AnalyticsEventItem` from Firebase, allowing us to add `@JsonSerializable()` to facilitate JSON serialisation and deserialisation. This capability is especially important because it allows us to efficiently map and manipulate lists of `CustomEventItem` objects. Out of the box, Firebase's `AnalyticsEventItem` provides a `parameters` field that we can use to set any additional custom item parameters not covered directly by Firebase Analytics, such as `itemMrc` or `itemLocation`. This flexibility means there's no need to create separate fields for these parameters; instead, they can be included directly in the `parameters` field. The `CustomEventItem` class, therefore, simplifies the process of handling and customising item details while ensuring compatibility with Firebase requirements.

**Note**: We extended `AnalyticsEventItem` to add `@JsonSerializable()` functionality, which made it easier to apply `.map()` operations on the `Product` list and ensure that these objects could be easily converted for both analytics and JSON handling.

## Summary

- Use `_convertToAnalyticsEventItem` to convert each `Product` to a `CustomEventItem`, which extends `AnalyticsEventItem` to support custom properties and enable `@JsonSerializable()` for easier handling.
- Methods like `logViewItemListEvent`, `logViewCart`, and `logPurchase` take a list of `Product` objects and log them as a batch by passing the converted list of items to Firebase Analytics.
- `CustomEventItem` provides extra flexibility by supporting additional properties through the `parameters` field and JSON serialisation, making it easy to track rich data across your analytics.
