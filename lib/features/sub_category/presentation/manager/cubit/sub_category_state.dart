part of 'sub_category_cubit.dart';

sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class SubCategoryLoading extends SubCategoryState {}

final class SubCategoriesLoaded extends SubCategoryState {
  final List<SubCategoryEntity> subCategories;

  SubCategoriesLoaded(this.subCategories);
}

final class FilterSubCategoriesLoaded extends SubCategoryState {
  final List<SubCategoryEntity> filterSubCategories;

  FilterSubCategoriesLoaded(this.filterSubCategories);
}

final class SubCategoyByIdLoaded extends SubCategoryState {
  final SubCategoryEntity subCategory;

  SubCategoyByIdLoaded(this.subCategory);
}

final class SubCategoriesFailure extends SubCategoryState {
  final String message;

  SubCategoriesFailure(this.message);
}

class SelectedItemChanged extends SubCategoryState {
  final CategoryEntity? selectedItem;
  SelectedItemChanged(this.selectedItem);
}

class SubCategoryByIdLoaded extends SubCategoryState {
  final SubCategoryEntity selectedItem;
  SubCategoryByIdLoaded(this.selectedItem);
}
