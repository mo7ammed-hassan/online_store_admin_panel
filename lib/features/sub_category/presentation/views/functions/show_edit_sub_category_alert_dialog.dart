import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/cancel_btton_style.dart';

import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';

import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/widgets/edit_sub_category_form.dart';
import 'package:flutter/material.dart';

void showEditSubCategoryAlertDialog(BuildContext context,
    {required SubCategoryEntity subCategoryEntity}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Edit Sub Category'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: EditSubCategorySubmitForm(
          subCategoryEntity: subCategoryEntity,
        ),
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
