import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

ButtonStyle? confirmElevatedButtonStyle() => ElevatedButton.styleFrom(
  
      elevation: 3,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.blueAccent.withOpacity(0.3),
        ),
      ),
    );
