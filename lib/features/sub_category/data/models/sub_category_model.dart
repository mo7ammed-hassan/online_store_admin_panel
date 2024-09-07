import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/sub_category_data.dart';

class SubCategoryModel {
  final bool success;
  final String message;
  final List<Data>? data;

  SubCategoryModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
