// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_event_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomEventItem _$CustomEventItemFromJson(Map<String, dynamic> json) =>
    CustomEventItem(
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      itemCategory: json['itemCategory'] as String?,
      itemCategory2: json['itemCategory2'] as String?,
      itemCategory3: json['itemCategory3'] as String?,
      itemCategory4: json['itemCategory4'] as String?,
      itemCategory5: json['itemCategory5'] as String?,
      itemVariant: json['itemVariant'] as String?,
      itemBrand: json['itemBrand'] as String?,
      price: json['price'] as num?,
      currency: json['currency'] as String?,
      affiliation: json['affiliation'] as String?,
      coupon: json['coupon'] as String?,
      discount: json['discount'] as num?,
      index: (json['index'] as num?)?.toInt(),
      itemListId: json['itemListId'] as String?,
      itemListName: json['itemListName'] as String?,
      locationId: json['locationId'] as String?,
      promotionId: json['promotionId'] as String?,
      promotionName: json['promotionName'] as String?,
      creativeName: json['creativeName'] as String?,
      creativeSlot: json['creativeSlot'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$CustomEventItemToJson(CustomEventItem instance) =>
    <String, dynamic>{
      'affiliation': instance.affiliation,
      'currency': instance.currency,
      'coupon': instance.coupon,
      'creativeName': instance.creativeName,
      'creativeSlot': instance.creativeSlot,
      'discount': instance.discount,
      'index': instance.index,
      'itemBrand': instance.itemBrand,
      'itemCategory': instance.itemCategory,
      'itemCategory2': instance.itemCategory2,
      'itemCategory3': instance.itemCategory3,
      'itemCategory4': instance.itemCategory4,
      'itemCategory5': instance.itemCategory5,
      'itemId': instance.itemId,
      'itemListId': instance.itemListId,
      'itemListName': instance.itemListName,
      'itemName': instance.itemName,
      'itemVariant': instance.itemVariant,
      'locationId': instance.locationId,
      'price': instance.price,
      'promotionId': instance.promotionId,
      'promotionName': instance.promotionName,
      'quantity': instance.quantity,
      'parameters': instance.parameters,
    };
