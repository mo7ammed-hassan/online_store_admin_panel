import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/cancel_btton_style.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/views/widgets/brand_submit_form.dart';
import 'package:flutter/material.dart';

void showAddBrandAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Add Brnad'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: const BrandSubmitForm(),
        actions: [
          TextButton(
            style: cancelButtonStyle(),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
