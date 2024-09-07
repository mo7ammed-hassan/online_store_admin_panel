import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/widgets/sub_category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildSubCategoryList extends StatelessWidget {
  const BuildSubCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryCubit, SubCategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubCategoryLoading) {
          final subCategories =
              BlocProvider.of<SubCategoryCubit>(context).subCategoriesList;
          return subCategories.isNotEmpty
              ? SubCategoryList(subCategories: subCategories)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        } else if (state is SubCategoriesLoaded) {
          return SubCategoryList(
            subCategories: state.subCategories,
          );
        } else if (state is SubCategoriesFailure) {
          final subCategories =
              BlocProvider.of<SubCategoryCubit>(context).subCategoriesList;
          return subCategories.isNotEmpty
              ? SubCategoryList(subCategories: subCategories)
              : Center(
                  child: Text('Error: ${state.message}'),
                );
        } else {
          final subCategories =
              BlocProvider.of<SubCategoryCubit>(context).subCategoriesList;
          return subCategories.isNotEmpty
              ? SubCategoryList(subCategories: subCategories)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }
      },
    );
  }
}
