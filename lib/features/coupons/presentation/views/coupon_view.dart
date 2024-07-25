import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/main_view_header.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/widgets/coupons_list_section.dart';
import 'package:flutter/material.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            MainViewsHeader(title: 'Coupon Codes', onChange: (vlaue) {}),
            const SizedBox(height: defaultPadding),
            CustomAppBar(
              onPressed: () {},
              title: 'My sub Categories',
              onPressedRefresh: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const CouponListSection(),
          ],
        ),
      ),
    );
  }
}
