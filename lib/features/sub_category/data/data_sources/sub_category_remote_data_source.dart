import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/helper/get_sub_category_list.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/sub_category_data.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';

abstract class SubCategoryRemoteDataSource {
  Future<List<SubCategoryEntity>> fetchSubCategories();

  Future<SubCategoryEntity> getSubCategoryById({
    required String subCategoryId,
  });

  Future<SubCategoryEntity> addSubCategory({
    required String name,
    required String categoryId,
  });

  Future<SubCategoryEntity> updateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  });

  Future<void> deleteSubCategory({
    required String subCategoryId,
  });
}

// IMPLEMENTATION
class SubCategoryRemoteDataSourceImpl extends SubCategoryRemoteDataSource {
  final ApiService _service;

  SubCategoryRemoteDataSourceImpl(this._service);

  @override
  Future<List<Data>> fetchSubCategories() async {
    Map<String, dynamic> jsonData =
        await _service.getItems(endPoint: 'subCategories');

    List<Data> subCategories = getSubCategoriesList(jsonData); 
    return subCategories;
  }

  @override
  Future<SubCategoryEntity> getSubCategoryById({
    required String subCategoryId,
  }) async {
    Map<String, dynamic> subCategory = await _service.getItemById(
        endPoint: 'subCategories', itemId: subCategoryId);

    SubCategoryEntity subCategoryItem = getSingleSubCatregory(subCategory);

    return subCategoryItem;
  }

  @override
  Future<SubCategoryEntity> addSubCategory({
    required String name,
    required String categoryId,
  }) async {
    var response = await _service.addItem(
      endPoint: 'subCategories',
      itemData: {
        'name': name,
        'categoryId': categoryId,
      },
    );
    SubCategoryEntity newSubCategory =
        SubCategoryEntity.fromJson(response['data']);

    return newSubCategory;
  }

  @override
  Future<SubCategoryEntity> updateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  }) async {
    final response = await _service.updateItem(
      endPoint: 'subCategories',
      itemId: subCategoryId,
      itemData: {
        'name': name,
        'categoryId': categoryId,
      },
    );

    SubCategoryEntity updatedSubCategory =
        SubCategoryEntity.fromJson(response['data']);

    return updatedSubCategory;
  }

  @override
  Future<void> deleteSubCategory({required String subCategoryId}) async {
    await _service.deleteItem(endPoint: 'subCategories', itemId: subCategoryId);
  }
}
