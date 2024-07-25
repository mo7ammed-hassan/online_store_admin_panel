import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/widgets/category_submit_form.dart';
import 'package:flutter/material.dart';

void showAddCategoryForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: secondaryColor,
        title: Center(
          child: Text(
            'Add Category'.toUpperCase(),
            style: const TextStyle(color: primaryColor),
          ),
        ),
        content: const CategorySubmitForm(),
      );
    },
  );
}