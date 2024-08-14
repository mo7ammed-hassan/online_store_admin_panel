import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryUse) : super(CategoryInitial());

  final CategoryUseCaseImp _categoryUse;
  List<CategoryEntity> categoriesList = [];

  Future<void> getAllCategories() async {
    emit(GetAllCategoryLoading());

    final Either<Failure, List<CategoryEntity>> categoriesResult =
        await _categoryUse.callGetCategories();

    categoriesResult.fold(
      (failure) => emit(GetAllCategoriesFailure(failure.message)),
      (categories) {
        categoriesList = categories;
        emit(GetAllCategoriesSuccess(List.from(categoriesList)));
      },
    );
  }

  Future<void> addCategory({
    required String name,
    required File imageFile,
  }) async {
    emit(AddCategoryLoading());

    final Either<Failure, CategoryEntity> addResult =
        await _categoryUse.callAddCategory(
      name: name,
      imageFile: imageFile,
    );

    addResult.fold(
      (failure) => emit(AddCategoryFailure(failure.message)),
      (category) {
        categoriesList.add(category);
        print("Updated categoriesList length: ${categoriesList.length}");

        emit(GetAllCategoriesSuccess(List.from(categoriesList)));
        emit(AddCategorySuccess(category));
      },
    );
  }

  Future<void> updateCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  }) async {
    emit(UpdateCategoryLoading());

    final Either<Failure, CategoryEntity> updateResult =
        await _categoryUse.callUpdateCategory(
      categoryId: categoryId,
      category: data,
    );

    updateResult.fold(
      (failure) => emit(UpdateCategoryFailure(failure.message)),
      (updatedCategory) {
        final index =
            categoriesList.indexWhere((category) => category.id == categoryId);
        if (index != -1) {
          categoriesList[index] = updatedCategory;
          emit(GetAllCategoriesSuccess(List.from(categoriesList)));
          emit(UpdateCategorySuccess());
        } else {
          emit(UpdateCategoryFailure('Category not found in the list'));
        }
      },
    );
  }

  Future<void> deleteCategory({required String categoryId}) async {
    emit(DeleteCategoryLoading());

    final Either<Failure, void> deleteResult =
        await _categoryUse.callDeleteCategory(categoryId: categoryId);

    deleteResult.fold(
      (failure) => emit(DeleteCategoryFailure(failure.message)),
      (_) {
        categoriesList.removeWhere((category) => category.id == categoryId);
        emit(GetAllCategoriesSuccess(List.from(categoriesList)));
        emit(DeleteCategorySuccess());
      },
    );
  }
}
