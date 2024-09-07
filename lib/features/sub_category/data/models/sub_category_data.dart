import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/category_id.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';

class Data extends SubCategoryEntity {
  final String? subId;
  final String? subName;
  final CategoryId? catId;
  final String? subCreatedAt;
  final String? subUpdatedAt;

  Data({
    this.subId,
    this.subName,
    this.catId,
    this.subCreatedAt,
    this.subUpdatedAt,
  }) : super(
          id: subId ?? '',
          name: subName ?? '',
          categoryId: catId?.id ?? '',
          createdAt: subCreatedAt ?? '',
          updatedAt: subUpdatedAt ?? '',
        );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      subId: json['_id'] as String,
      subName: json['name'] as String,
      catId: json['categoryId'] == null
          ? null
          : CategoryId.fromJson(json['categoryId'] as Map<String, dynamic>),
      subCreatedAt:
          json['createdAt'] == null ? null : json['createdAt'] as String,
      subUpdatedAt:
          json['updatedAt'] == null ? null : json['updatedAt'] as String,
    );
  }
}
