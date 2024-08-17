import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.createdAt,
    required super.updatedAt,
  }) : super();

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['image'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': imageUrl,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }
}
