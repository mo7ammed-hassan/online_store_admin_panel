import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/cancel_btton_style.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/widgets/sub_category_submit_form.dart';
import 'package:flutter/material.dart';

void showAddSubCategoryAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Add Sub Category'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: const SubCategorySubmitForm(),
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
