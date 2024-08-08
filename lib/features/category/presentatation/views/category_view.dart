import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_add_category_form.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/setup_services_locator.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/snak_bar_helper.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/main_view_header.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/widgets/category_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<CategoryUseCaseImp>())..getAllCategories(),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              MainViewsHeader(
                title: 'Category',
                onChange: (vlaue) {},
              ),
              const SizedBox(height: defaultPadding),
              CustomAppBar(
                onPressed: () {
                  showAddCategoryForm(context);
                },
                title: 'My Category',
                onPressedRefresh: () {},
              ),
              const SizedBox(height: 20),
              BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is DeleteCategorySuccess) {
                    showTopSnackBar(context, 'Delete Category Success');
                  }
                  if (state is UpdateCategorySuccess) {
                    showTopSnackBar(context, 'Update Category Success');
                  }
                },
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetAllCategoriesSuccess) {
                    return CategoryListSection(categories: state.categories);
                  } else if (state is GetAllCategoriesFailure) {
                    return Text(
                      'Error: ${state.message}',
                    ); //  i should replace it to display data
                  } else {
                    return const Text('Unexpected state');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
