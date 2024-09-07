import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/sub_category_data.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';

abstract class SubCategoryRepo {
  Future<Either<Failure, List<Data>>> fetchSubCategories();
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(
    String subCategoryId,
  );
  Future<Either<Failure, SubCategoryEntity>> addSubCategory({
    required String name,
    required String categoryId,
  });
  Future<Either<Failure, SubCategoryEntity>> updateSubCategory({
    required String name,
    required String subCategoryId,
    required String categoryId,
  });
  Future<Either<Failure, void>> deleteSubCategory(String subCategoryId);
}
