// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/helper/get_category_list.dart';

import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

abstract class CategoryRemoteDataSource {
  // getCategories
  Future<List<CategoryEntity>> getCategories();
  // deleteCategories
  Future<void> deleteCategories({required String categoryId});
  // updateCategories
  Future<void> updateCategories({
    required String categoryId,
    required Map<String, dynamic> category,
  });
  // addCategories
  Future<void> addCategories({required String name, required File imageFile});
  // getCategoryById
  Future<CategoryEntity> getCategoryById({required String categoryId});
}

// IMPLEMENTATION
class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  // create instance of ApiService
  final ApiService _service;

  CategoryRemoteDataSourceImpl(
    this._service,
  );

  @override
  Future<void> deleteCategories({required String categoryId}) async {
    await _service.deleteItem(endPoint: 'categories', itemId: categoryId);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    Map<String, dynamic> jsonCategories =
        await _service.getItems(endPoint: 'categories');

    List<CategoryEntity> categories = getCategoriesList(jsonCategories);

    return categories;
  }

  @override
  Future<CategoryEntity> updateCategories(
      {required String categoryId,
      required Map<String, dynamic> category}) async {
    final categoryUpdated = await _service.updateItem(
      endPoint: 'categories',
      itemId: categoryId,
      itemData: category,
    );
    return CategoryEntity.fromJson(categoryUpdated['data']);
  }

  @override
  Future<CategoryEntity> addCategories(
      {required String name, required File imageFile}) async {
    final categoryData = await _service.addItem(
      endPoint: 'categories',
      itemData: FormData.fromMap(
        {
          'name': name,
          'img': await MultipartFile.fromFile(imageFile.path),
        },
      ),
    );
    return CategoryEntity.fromJson(categoryData['data']);
  }

  @override
  Future<CategoryEntity> getCategoryById({required String categoryId}) async {
    Map<String, dynamic> category =
        await _service.getItemById(endPoint: 'categories', itemId: categoryId);

    CategoryEntity categoryItem = getOneCategory(category);

    return categoryItem;
  }
}
