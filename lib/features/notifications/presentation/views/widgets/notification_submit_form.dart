import 'dart:developer';

import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NotificationSubmitForm extends StatefulWidget {
  const NotificationSubmitForm({
    super.key,
  });

  @override
  State<NotificationSubmitForm> createState() => _NotificationSubmitFormState();
}

class _NotificationSubmitFormState extends State<NotificationSubmitForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialogContentDecoration(
      widthValue: 0.66,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: titleController,
              labelText: 'Enter Notification Title',
              onSaved: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required.';
                }
                return null;
              },
            ),
            const SizedBox(height: defaultPadding),
            CustomTextFormField(
              controller: descriptionController,
              labelText: 'Enter Notification Description',
              onSaved: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description is required.';
                }
                return null;
              },
            ),
            const SizedBox(height: defaultPadding),
            CustomTextFormField(
              controller: imageUrlController,
              labelText: 'Enter Notification Image Url',
              onSaved: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Image is required.';
                }
                return null;
              },
            ),
            const SizedBox(height: defaultPadding * 2),
            ElevatedButton(
              style: confirmElevatedButtonStyle(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // trigger cubit
                  log(titleController.text);
                  log(descriptionController.text);
                  log(imageUrlController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
