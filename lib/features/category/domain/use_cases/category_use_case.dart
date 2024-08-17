import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/repos/category_repo.dart';

abstract class CategoryUseCase {
  Future<Either<Failure, List<CategoryEntity>>> callFetchCategories();

  Future<Either<Failure, CategoryEntity>> callGetCategoryById({
    required String categoryId,
  });
  Future<Either<Failure, CategoryEntity>> callAddCategory({
    required String name,
    required String imagePath,
  });
  Future<Either<Failure, CategoryEntity>> callUpdateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  });
  Future<Either<Failure, void>> callDeleteCategory({
    required String categoryId,
  });
}

// --IMPLEMENTATION--
class CategoryUseCaseImp extends CategoryUseCase {
  CategoryRepo categoryRepo;
  CategoryUseCaseImp(
    this.categoryRepo,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> callFetchCategories() async {
    return await categoryRepo.fetchCategories();
  }

  @override
  Future<Either<Failure, CategoryEntity>> callGetCategoryById(
      {required String categoryId}) async {
    return await categoryRepo.getCategoryById(categoryId: categoryId);
  }

  @override
  Future<Either<Failure, CategoryEntity>> callAddCategory({
    required String name,
    required String imagePath,
  }) async {
    return await categoryRepo.addCategory(name: name, imagePath: imagePath);
  }

  @override
  Future<Either<Failure, CategoryEntity>> callUpdateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  }) async {
    return await categoryRepo.updateCategory(
      categoryId: categoryId,
      name: name,
      imagePath: imagePath,
    );
  }

  @override
  Future<Either<Failure, void>> callDeleteCategory({
    required String categoryId,
  }) async {
    return await categoryRepo.deleteCategory(categoryId: categoryId);
  }
}
