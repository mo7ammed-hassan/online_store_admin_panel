import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/main_view_header.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/widgets/order_list_section.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/widgets/order_view_app_bar.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      primary: false,
      child: Column(
        children: [
          MainViewsHeader(
            title: 'Order',
            onChange: (vlaue) {},
          ),
          const SizedBox(height: defaultPadding),
          const OrderViewAppBar(),
          const SizedBox(height: defaultPadding),

          // lorder list sections+
          const OrderListSection(),
        ],
      ),
    );
  }
}
