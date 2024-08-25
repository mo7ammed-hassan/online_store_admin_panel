import 'dart:io';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/item_submit_form.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showAddCategoyAlertDialog(
  BuildContext context,
) {
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
          onSubmit: (String categoryName, File? image) {
            final cubit = context.read<CategoryCubit>();
            cubit.addCategory(name: categoryName, imagePath: image!.path);
            Navigator.pop(context);
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
