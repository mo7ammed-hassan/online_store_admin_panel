import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/main_view_header.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/views/widgets/brand_list_section.dart';
import 'package:flutter/material.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // app bar
            MainViewsHeader(title: 'Brands', onChange: (value) {}),
            const SizedBox(height: defaultPadding),
            CustomAppBar(
              onPressed: () {},
              title: 'My Categories',
              onPressedRefresh: () {},
            ),
            //...your main content goes here...
            const SizedBox(height: 20),
            // prand sections
           const BrandListSection(),
          ],
        ),
      ),
    );
  }
}
