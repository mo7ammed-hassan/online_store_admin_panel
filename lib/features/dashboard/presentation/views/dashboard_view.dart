import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/dashboard_containt.dart';

import 'package:flutter/material.dart';

class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Dashboard header
            ViewHeader(
              title: "Dashboard",
              // search term
              onChanged: (value) {},
              // search button
              onTap: () {},
            ),
            const SizedBox(height: defaultPadding),
            const DashboardContaint(),
          ],
        ),
      ),
    );
  }
}
