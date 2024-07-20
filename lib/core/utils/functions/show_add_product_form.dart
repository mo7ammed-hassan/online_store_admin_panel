
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_submit_form.dart';
import 'package:flutter/material.dart';

void showAddProductForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Add Product'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: const ProductSubmitForm(),
      );
    },
  );
}
