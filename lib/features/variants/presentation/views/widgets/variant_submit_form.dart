import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class VariantSubmitForm extends StatefulWidget {
  const VariantSubmitForm({
    super.key,
    required this.onSubmit,
    required this.variantController,
    required this.formKey,
    required this.lableText,
  });
  final GlobalKey<FormState> formKey;
  final Function(String variantname, String color) onSubmit;
  final TextEditingController variantController;
  final String lableText;
  @override
  State<VariantSubmitForm> createState() => _VariantSubmitFormState();
}

class _VariantSubmitFormState extends State<VariantSubmitForm> {
  String? color;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: AlertDialogContentDecoration(
        widthValue: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: defaultPadding * 2),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    onChanged: (newVal) {
                      // Handle the new value
                      setState(() {
                        color = newVal;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a Color';
                      }
                      return null;
                    },
                    hintText: 'colors',
                    initialValue: 'Blue',
                    items: const [
                      'Blue',
                      'Red',
                      'Green',
                      'Yellow',
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormField(
                    controller: widget.variantController,
                    labelText: '${widget.lableText} Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${widget.lableText} name is required.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            ElevatedButton(
              style: confirmElevatedButtonStyle(),
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  widget.onSubmit(
                    widget.variantController.text,
                    color!,
                  );
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
