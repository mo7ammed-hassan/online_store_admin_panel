import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/coupon_view.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: CouponView(),
            ),
          ],
        ),
      ),
    );
  }
}
