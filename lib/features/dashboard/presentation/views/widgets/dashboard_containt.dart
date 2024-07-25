import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_add_product_form.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/order_details_view.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_list_section.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_summary_section.dart';
import 'package:flutter/material.dart';

class DashboardContaint extends StatelessWidget {
  const DashboardContaint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  showAddProductForm(context);
                },
                title: 'My Products',
                onPressedRefresh: () {},
              ),
              const SizedBox(height: defaultPadding),
              // product summary section
              const ProductSummarySection(),
              const SizedBox(height: defaultPadding),
              // product list section
              const ProductListSection(),
            ],
          ),
        ),
        const SizedBox(width: defaultPadding),
        const Expanded(
          flex: 2,
          child: OrderDetailsView(),
        )
      ],
    );
  }
}
