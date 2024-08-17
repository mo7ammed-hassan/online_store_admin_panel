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

  Future<void> fetchCategories() async {
    emit(CategoryLoading());

    final Either<Failure, List<CategoryEntity>> categoriesResult =
        await _categoryUse.callFetchCategories();

    categoriesResult.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) {
        categoriesList = List.from(categories); // Ensure a fresh list is used
        emit(CategoryLoaded(categoriesList));
      },
    );
  }

  Future<void> getSingleCategory({required String categoryId}) async {
    emit(CategoryLoading());

    final Either<Failure, CategoryEntity> categoryResult =
        await _categoryUse.callGetCategoryById(categoryId: categoryId);

    categoryResult.fold(
      (failure) => emit(CategoryError(failure.message)),
      (category) => emit(CategoryByIdLoaded(category)),
    );
  }

  Future<void> addCategory({
    required String name,
    required String imagePath,
  }) async {
    final Either<Failure, CategoryEntity> addResult =
        await _categoryUse.callAddCategory(
      name: name,
      imagePath: imagePath,
    );

    addResult.fold(
      (failure) => emit(CategoryError(failure.message)),
      (category) async {
        categoriesList.add(category);
        emit(CategoryOperationSuccess("Category added successfully."));
        await fetchCategories(); // Refresh the list
      },
    );
  }

  Future<void> updateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  }) async {
    emit(CategoryLoading());

    final Either<Failure, CategoryEntity> updateResult =
        await _categoryUse.callUpdateCategory(
      categoryId: categoryId,
      name: name,
      imagePath: imagePath,
    );

    updateResult.fold(
      (failure) => emit(CategoryError(failure.message)),
      (updatedCategory) async {
        final index = categoriesList.indexWhere((category) => category.id == categoryId);
        if (index != -1) {
          categoriesList[index] = updatedCategory;
          emit(CategoryOperationSuccess("Category updated successfully."));
          await fetchCategories(); // Refresh the list
        } else {
          emit(CategoryError('Category not found in the list'));
        }
      },
    );
  }

  Future<void> deleteCategory({required String categoryId}) async {
    emit(CategoryLoading());

    final Either<Failure, void> deleteResult =
        await _categoryUse.callDeleteCategory(categoryId: categoryId);

    deleteResult.fold(
      (failure) => emit(CategoryError(failure.message)),
      (_) async {
        categoriesList.removeWhere((category) => category.id == categoryId);
        emit(CategoryOperationSuccess("Category deleted successfully."));
        await fetchCategories(); // Refresh the list
      },
    );
  }
}
