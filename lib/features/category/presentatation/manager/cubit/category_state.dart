part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class GetAllCategoriesSuccess extends CategoryState {
  final List<CategoryEntity> categories;
  GetAllCategoriesSuccess(this.categories);
}

class GetAllCategoriesFailure extends CategoryState {
  final String message;
  GetAllCategoriesFailure(this.message);
}

class GetSingleCategorySuccess extends CategoryState {
  final CategoryEntity category;
  GetSingleCategorySuccess(this.category);
}

class GetSingleCategoryFailure extends CategoryState {
  final String message;
  GetSingleCategoryFailure(this.message);
}

class UpdateCategoryLoading extends CategoryState {}

class UpdateCategorySuccess extends CategoryState {}

class UpdateCategoryFailure extends CategoryState {
  final String message;
  UpdateCategoryFailure(this.message);
}

class DeleteCategoryLoading extends CategoryState {}

class DeleteCategorySuccess extends CategoryState {}

class DeleteCategoryFailure extends CategoryState {
  final String message;
  DeleteCategoryFailure(this.message);
}
