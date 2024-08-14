import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/functions/show_add_brand.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/views/widgets/brand_list_section.dart';
import 'package:flutter/material.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            const ViewHeader(
              title: 'Brands',
            ),
            const SizedBox(height: defaultPadding * 1.5),
            SecoundyViewHeader(
              title: 'My category',
              addNewOnTap: () {
                showAddBrandAlertDialog(context);
              },
              refreshOnTap: () async {
                // triger gell all categories
              },
            ),
            const SizedBox(height: 20),
            const BrandListSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
