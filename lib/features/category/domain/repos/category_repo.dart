import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

abstract class CategoryRepo {
  // get all the categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  // get one category by id
  Future<Either<Failure, CategoryEntity>> getCategoryById(
      {required String categoryId});
  // delete one or more categories
  Future<Either<Failure, void>> deleteCategories({required String categoryId});
  // update one or more categories
  Future<Either<Failure, void>> updateCategories({
    required String categoryId,
    required Map<String, dynamic> category,
  });
  // add one or more categories
  Future<Either<Failure, void>> addCategories(
      {required CategoryEntity category});
}

// in cubit i should call getcategories if i delete one or more categories