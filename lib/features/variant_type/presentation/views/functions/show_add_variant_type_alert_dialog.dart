import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/variants/presentation/views/widgets/variant_submit_form.dart';
import 'package:flutter/material.dart';

void showAddVariantTypeAlertDialog(
  BuildContext context,
) {
  final formKey = GlobalKey<FormState>();
  final TextEditingController variantController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: secondaryColor,
        title: Center(
          child: Text(
            'Add Variant Type'.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        content: VariantSubmitForm(
          formKey: formKey,
          lableText: 'Variant Type',
          variantController: variantController,
          onSubmit: (String variantname, String color) {},
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
