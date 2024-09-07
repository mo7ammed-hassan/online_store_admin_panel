import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();

  Future<Either<Failure, CategoryEntity>> getCategoryById({
    required String categoryId,
  });

  Future<Either<Failure, CategoryEntity>> addCategory({
    required String name,
    required String imagePath,
  });

  Future<Either<Failure, CategoryEntity>> updateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  });

  Future<Either<Failure, void>> deleteCategory({
    required String categoryId,
  });
}
