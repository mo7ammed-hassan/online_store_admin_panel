import 'package:ecommerce_app_admin_panel/core/utils/lists/drawer_items_list.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class DraweritemsSliverList extends StatefulWidget {
  const DraweritemsSliverList({super.key});

  @override
  State<DraweritemsSliverList> createState() => _DraweritemsSliverListState();
}

class _DraweritemsSliverListState extends State<DraweritemsSliverList> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: draweritemsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
          },
          child: DrawerItem(
            drawerItem: draweritemsList[index],
          ),
        );
      },
    );
  }
}
