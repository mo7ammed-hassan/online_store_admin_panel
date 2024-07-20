import 'package:ecommerce_app_admin_panel/core/utils/models/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    this.onTap,
    required this.drawerItem,
  });
  final DrawerItemModel drawerItem;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        drawerItem.iconPath,
        height: 16,
        colorFilter: const ColorFilter.mode(
          Colors.white54,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        drawerItem.title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
