import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

ButtonStyle cancelButtonStyle() {
  return ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    backgroundColor: const WidgetStatePropertyAll(
      secondaryColor,
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.all(20),
    ),
  );
}
