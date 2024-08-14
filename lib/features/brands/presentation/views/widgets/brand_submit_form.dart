import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/functions/custom_brand_text_form_filed.dart';
import 'package:flutter/material.dart';

class BrandSubmitForm extends StatelessWidget {
  const BrandSubmitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
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
                      newVal = 'value';
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a Sub Category';
                      }
                      return null;
                    },
                    hintText: 'Mobile', //?? 'Select Sub Category'
                    initialValue: 'Mobile',
                    items: const [
                      'Mobile',
                      'Laptop',
                      'Smartwatch',
                      'Tablet',
                      'Headphones',
                      'Accessories',
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: CustomBrandTextFormField(
                    labelText: 'Brand Name',
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            ElevatedButton(
              style: confirmElevatedButtonStyle(),
              onPressed: () {},
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
