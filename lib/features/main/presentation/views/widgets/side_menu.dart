import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/drawer_items_sliver_list.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          const DraweritemsSliverList(),
        ],
      ),
    );
  }
}
