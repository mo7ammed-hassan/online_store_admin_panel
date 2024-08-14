import 'dart:io';

import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/item_submit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showEditCategoyAlertDialog(
  BuildContext context, {
  required CategoryEntity category,
}) {
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
        content: BlocProvider.value(
          value: BlocProvider.of<CategoryCubit>(context),
          child: ItemSubmitForm(
            formKey: formKey,
            itemNameController: categoryNameController,
            onSubmit: (String categoryName, File? image) async {
              // Trigger the Bloc event here with the category name and image
              await BlocProvider.of<CategoryCubit>(context).updateCategory(
                categoryId: category.id,
                data: {
                  'name': categoryName,
                  'image': image ?? category.categoryImage,
                },
              );
            }, lableText: 'Category',
          ),
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
