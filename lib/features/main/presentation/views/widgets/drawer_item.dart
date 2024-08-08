import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });
  final String title, svgSrc;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        height: 16,
        colorFilter: const ColorFilter.mode(
          Colors.white54,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
