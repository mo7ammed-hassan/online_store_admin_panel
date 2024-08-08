import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryUse) : super(CategoryInitial());

  final CategoryUseCaseImp _categoryUse;

  Future<void> getAllCategories() async {
    emit(CategoryLoading());

    final Either<Failure, List<CategoryEntity>> categoriesResult =
        await _categoryUse.callGetCategories();

    categoriesResult.fold(
      (failure) => emit(GetAllCategoriesFailure(failure.message)),
      (categories) => emit(GetAllCategoriesSuccess(categories)),
    );
  }

  Future<void> getCategoryById({required String categoryId}) async {
    emit(CategoryLoading());

    final Either<Failure, CategoryEntity> categoryResult =
        await _categoryUse.callGetCategoryById(categoryId: categoryId);

    categoryResult.fold(
      (failure) => emit(GetSingleCategoryFailure(failure.message)),
      (category) => emit(GetSingleCategorySuccess(category)),
    );
  }

  Future<void> updateCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  }) async {
    emit(UpdateCategoryLoading());

    final Either<Failure, void> updateResult =
        await _categoryUse.callUpdateCategory(
      categoryId: categoryId,
      category: data,
    );

    updateResult.fold(
      (failure) => emit(UpdateCategoryFailure(failure.message)),
      (_) {
        emit(UpdateCategorySuccess());
        getAllCategories();
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
        emit(DeleteCategorySuccess());
        getAllCategories();
      },
    );
  }
}
