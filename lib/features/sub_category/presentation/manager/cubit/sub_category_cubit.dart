import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/use_cases/sub_category_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(this._useCaseImpl) : super(SubCategoryInitial());
  final SubCategoryUseCaseImpl _useCaseImpl;
  List<SubCategoryEntity> subCategoriesList = [];
  List<SubCategoryEntity> subCategoriesFilter = [];
  CategoryEntity? selectedItem;
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> fetchSubCategories() async {
    emit(SubCategoryLoading());
    var result = await _useCaseImpl.callFetchSubCategories();
    result.fold(
      (failure) {
        emit(SubCategoriesFailure(failure.toString()));
      },
      (subCategories) {
        subCategoriesList = subCategories;
        emit(SubCategoriesLoaded(subCategories));
      },
    );
  }

  Future<void> fetchSubCategoryById(String subCategoryId) async {
    emit(SubCategoryLoading());
    var result = await _useCaseImpl.callGetSubCategoryById(subCategoryId);
    result.fold(
      (failure) => emit(SubCategoriesFailure(failure.toString())),
      (subCategory) {
        emit(SubCategoryByIdLoaded(subCategory));
      },
    );
  }

  Future<void> addSubCategory({
    required String name,
    required String categoryId,
  }) async {
    emit(SubCategoryLoading());
    var result = await _useCaseImpl.callAddSubCategory(
      name: name,
      categoryId: categoryId,
    );
    result.fold(
      (failure) {
        emit(SubCategoriesFailure(failure.toString()));
      },
      (newSubCategory) {
        subCategoriesList.add(newSubCategory);
        emit(SubCategoriesLoaded(subCategoriesList));
        nameController.clear();
      },
    );
  }

  Future<void> updateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  }) async {
    emit(SubCategoryLoading());
    var result = await _useCaseImpl.callUpdateSubCategory(
      name: name,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );

    result.fold(
      (failure) {
        emit(SubCategoriesFailure(failure.toString()));
      },
      (updatedSubCategory) {
        final index = subCategoriesList.indexWhere(
          (element) => element.id == subCategoryId,
        );
        if (index != -1) {
          subCategoriesList[index] = updatedSubCategory;
          emit(SubCategoriesLoaded(subCategoriesList));
          nameController.clear();
        } else {
          emit(SubCategoriesFailure("Sub category not found"));
        }
      },
    );
  }

  Future<void> deleteSubCategory(String subCategoryId) async {
    emit(SubCategoryLoading());
    var result = await _useCaseImpl.callDeleteSubCategory(subCategoryId);
    result.fold(
      (failure) {
        emit(SubCategoriesFailure(failure.toString()));
      },
      (_) {
        subCategoriesList
            .removeWhere((subCategory) => subCategory.id == subCategoryId);
        emit(SubCategoriesLoaded(subCategoriesList));
      },
    );
  }

  // Update selected category for filtering or editing
  void updateSelectedItem(CategoryEntity? newVal) {
    selectedItem = newVal;
    emit(SelectedItemChanged(selectedItem));
  }

  // Search for sub-category by name
  void searchForItem(String subCategoryName) {
    subCategoriesFilter = subCategoriesList.where((subCategory) {
      return subCategory.name
          .toLowerCase()
          .contains(subCategoryName.toLowerCase());
    }).toList();
    emit(FilterSubCategoriesLoaded(subCategoriesFilter));
  }
}
