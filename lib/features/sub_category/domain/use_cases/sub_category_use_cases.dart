import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/repos/sub_category_repo.dart';

abstract class SubCategoryUseCases {
  Future<Either<Failure, List<SubCategoryEntity>>> callFetchSubCategories();
  Future<Either<Failure, SubCategoryEntity>> callGetSubCategoryById(
    String subCategoryId,
  );
  Future<Either<Failure, void>> callAddSubCategory({
    required String name,
    required String categoryId,
  });
  Future<Either<Failure, void>> callUpdateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  });
  Future<Either<Failure, void>> callDeleteSubCategory(String subCategoryId);
}

// --IMPLEMENTATION--
class SubCategoryUseCaseImpl extends SubCategoryUseCases {
  final SubCategoryRepo subCategoryRepo;

  SubCategoryUseCaseImpl({required this.subCategoryRepo});

  @override
  Future<Either<Failure, List<SubCategoryEntity>>> callFetchSubCategories() {
    return subCategoryRepo.fetchSubCategories();
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> callGetSubCategoryById(
    String subCategoryId,
  ) {
    return subCategoryRepo.getSubCategoryById(subCategoryId);
  }

  @override
  Future<Either<Failure, void>> callAddSubCategory({
    required String name,
    required String categoryId,
  }) {
    return subCategoryRepo.addSubCategory(
      name: name,
      categoryId: categoryId,
    );
  }

  @override
  Future<Either<Failure, void>> callUpdateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  }) {
    return subCategoryRepo.updateSubCategory(
      subCategoryId: subCategoryId,
      name: name,
      categoryId: categoryId,
    );
  }

  @override
  Future<Either<Failure, void>> callDeleteSubCategory(String subCategoryId) {
    return subCategoryRepo.deleteSubCategory(subCategoryId);
  }
}
