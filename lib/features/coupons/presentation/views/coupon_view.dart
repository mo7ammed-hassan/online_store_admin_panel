import 'dart:io';

import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/functions/show_add_coupon_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/widgets/coupon_list_section.dart';
import 'package:flutter/material.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            const ViewHeader(title: 'Coupon Codes'),
            const SizedBox(height: defaultPadding * 1.5),
            SecoundyViewHeader(
              title: 'My Sub Categories',
              addNewOnTap: () {
                showAddCouponAlertDialog(
                  context,
                  onSubmit: (String categoryName, File? image) {},
                );
              },
              refreshOnTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const CouponListSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
