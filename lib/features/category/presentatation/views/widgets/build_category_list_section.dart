import 'package:ecommerce_app_admin_panel/core/utils/helper/snak_bar_helper.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/widgets/category_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCategoryListSection extends StatelessWidget {
  const BuildCategoryListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      builder: (BuildContext context, state) {
        if (state is CategoryInitial || state is GetAllCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCategoriesSuccess) {
          return CategoryListSection(categories: state.categories);
        } else if (state is GetAllCategoriesFailure) {
          final categories =
              BlocProvider.of<CategoryCubit>(context).categoriesList;
          return categories.isNotEmpty
              ? CategoryListSection(categories: categories)
              : Center(child: Text('Error: ${state.message}'));
        } else {
          final categories =
              BlocProvider.of<CategoryCubit>(context).categoriesList;
          return categories.isNotEmpty
              ? CategoryListSection(categories: categories)
              : const Center(child: CircularProgressIndicator());
        }
      },
      listener: (BuildContext context, Object? state) {
        if (state is AddCategorySuccess) {
          showTopSnackBar(context, 'Add Category Success');
        }
        if (state is UpdateCategorySuccess) {
          showTopSnackBar(context, 'Update Category Success');
        }
        if (state is DeleteCategorySuccess) {
          showTopSnackBar(context, 'Delete Category Success');
        }
        // if (state is AddCategorySuccess ||
        //     state is UpdateCategorySuccess ||
        //     state is DeleteCategorySuccess) {
        //   BlocProvider.of<CategoryCubit>(context).getAllCategories();
        // }
      },
    );
  }
}
