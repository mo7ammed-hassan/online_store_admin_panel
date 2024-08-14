import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class AlertDialogContentDecoration extends StatelessWidget {
  const AlertDialogContentDecoration(
      {super.key, this.child, this.widthValue = 0.25});
  final Widget? child;
  final double? widthValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: MediaQuery.sizeOf(context).width * widthValue!,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: child,
    );
  }
}
