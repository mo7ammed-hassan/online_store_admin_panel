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
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          return CategoryListSection(categories: state.categories);
        } else if (state is CategoryError) {
          final categories =
              BlocProvider.of<CategoryCubit>(context).categoriesList;
          return categories.isNotEmpty
              ? CategoryListSection(categories: categories)
              : Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          final categories =
              BlocProvider.of<CategoryCubit>(context).categoriesList;
          return categories.isNotEmpty
              ? CategoryListSection(categories: categories)
              : const Center(child: CircularProgressIndicator());
        }
      },
      listener: (BuildContext context, CategoryState state) {
        if (state is CategoryOperationSuccess) {
          showTopSnackBar(context, state.message);
        } else if (state is CategoryOperationSuccess) {
          showTopSnackBar(context, 'Operation Failed: ${state.message}');
        }

        // Refresh the list if an operation succeeded
        if (state is CategoryOperationSuccess) {
          BlocProvider.of<CategoryCubit>(context).fetchCategories();
        }
      },
    );
  }
}
