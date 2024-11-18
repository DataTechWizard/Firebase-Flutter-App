import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_event_item.g.dart'; // Generated file

@JsonSerializable()
class CustomEventItem extends AnalyticsEventItem {
  @override
  final Map<String, Object>? parameters;
  CustomEventItem({
    super.itemId,
    super.itemName,
    super.itemCategory,
    super.itemCategory2,
    super.itemCategory3,
    super.itemCategory4,
    super.itemCategory5,
    super.itemVariant,
    super.itemBrand,
    super.price,
    super.currency,
    super.affiliation,
    super.coupon,
    super.discount,
    super.index,
    super.itemListId,
    super.itemListName,
    super.locationId,
    super.promotionId,
    super.promotionName,
    super.creativeName,
    super.creativeSlot,
    super.quantity,
    this.parameters,
  });

  // From JSON factory
  factory CustomEventItem.fromJson(Map<String, dynamic> json) =>
      _$CustomEventItemFromJson(json);

  // To JSON method
  Map<String, dynamic> toJson() => _$CustomEventItemToJson(this);
}
