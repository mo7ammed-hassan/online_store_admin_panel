part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  CategoryLoaded(this.categories);
}

class CategoryByIdLoaded extends CategoryState {
  final CategoryEntity category;
  CategoryByIdLoaded(this.category);
}

class CategoryOperationSuccess extends CategoryState {
  final String message;
  CategoryOperationSuccess(this.message);
}

class CategoryError extends CategoryState {
  final String errorMessage;
  CategoryError(this.errorMessage);
}
