import 'dart:io';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/item_submit_form.dart';
import 'package:flutter/material.dart';

void showAddCategoyAlertDialog(BuildContext context,
    {required Function(String categoryName, File? image) onSubmit}) {
  final formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: secondaryColor,
        title: Center(
          child: Text(
            'Add Category'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: ItemSubmitForm(
          formKey: formKey,
          itemNameController: categoryNameController,
          onSubmit: (String categoryName, File? image) async {
            Navigator.of(context).pop();
            await onSubmit(categoryName, image);
          },
          lableText: 'Category',
        ),
        actions: [
          TextButton(
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
