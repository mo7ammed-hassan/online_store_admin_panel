import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            child: SideMenu(),
          ),
          Expanded(
            flex: 5,
            child: Dashboardview(),
          ),
        ],
      )),
    );
  }
}
