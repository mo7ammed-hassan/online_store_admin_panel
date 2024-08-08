// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/repos/category_repo.dart';

abstract class CategoryUseCase {
  // get the category
  Future<Either<Failure, List<CategoryEntity>>> callGetCategories();
  // get the category by id
  Future<Either<Failure, CategoryEntity>> callGetCategoryById(
      {required String categoryId});
  // delete the category
  Future<Either<Failure, void>> callDeleteCategory(
      {required String categoryId});
  // update the category
  Future<Either<Failure, void>> callUpdateCategory(
      {required String categoryId, required CategoryEntity category});
  // add the category
  Future<Either<Failure, void>> callAddCategory(
      {required CategoryEntity category});
}

// --IMPLEMENTATION--
class CategoryUseCaseImp extends CategoryUseCase {
  CategoryRepo categoryRepo;
  CategoryUseCaseImp(
    this.categoryRepo,
  );
  @override
  Future<Either<Failure, void>> callDeleteCategory({required String categoryId}) async {
   return await categoryRepo.deleteCategories(categoryId: categoryId);
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> callGetCategories() async {
    return await categoryRepo.getCategories();
  }

  @override
  Future<Either<Failure, void>> callUpdateCategory(
      {required String categoryId, required CategoryEntity category}) async {
  return  await categoryRepo.updateCategories(
        categoryId: categoryId, category: category);
  }

  @override
  Future<Either<Failure, void>> callAddCategory({required CategoryEntity category}) async {
   return await categoryRepo.addCategories(category: category);
  }

  @override
  Future<Either<Failure, CategoryEntity>> callGetCategoryById(
      {required String categoryId}) async {
    return await categoryRepo.getCategoryById(categoryId: categoryId);
  }
}