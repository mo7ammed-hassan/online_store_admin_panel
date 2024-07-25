import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_add_category_form.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/main_view_header.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/widgets/category_list_section.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            const CategoryListSection(),
          ],
        ),
      ),
    );
  }
}
