import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/widgets/order_app_bar.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/widgets/order_list_section.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            ViewHeader(
              title: 'Order',
            ),
            SizedBox(height: defaultPadding * 1.5),
            OrderAppBar(),
            SizedBox(height: 20),
            OrderListSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
