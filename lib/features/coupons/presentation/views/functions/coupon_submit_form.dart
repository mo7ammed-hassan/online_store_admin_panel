import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/functions/custom_date_picker.dart';
import 'package:flutter/material.dart';

class CouponSubmitForm extends StatefulWidget {
  const CouponSubmitForm({super.key});

  @override
  State<CouponSubmitForm> createState() => _CouponSubmitFormState();
}

class _CouponSubmitFormState extends State<CouponSubmitForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  TextEditingController amountnControlle = TextEditingController();
  TextEditingController purchaseControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialogContentDecoration(
      widthValue: 0.66,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: codeController,
                    labelText: 'Coupon Code',
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Coupon Code name is required.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Discount Type',
                    items: const ['fixed', 'percentage'],
                    initialValue: 'fixed',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a discount type';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: amountnControlle,
                    labelText: 'Discount Amount',
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Discount Amount is required.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: CustomTextFormField(
                    controller: purchaseControlle,
                    labelText: 'Minimum Purchase Amount',
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Minimum Purchase Amount is required.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomDatePicker(
                    controller: TextEditingController(),
                    labelText: 'Select Date',
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateSelected: (DateTime date) {
                      print('Selected Date: $date');
                    },
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Status',
                    items: const ['active', 'inactive'],
                    initialValue: 'active',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select status';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Select category',
                    items: const [
                      'Electronics',
                      'Clothing',
                      'Home & Garden',
                      'Sports & Outdoors',
                    ],
                    initialValue: 'Electronics',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select status';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: defaultPadding / 2),
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Select sub category',
                    items: const [
                      'Mobile Phones',
                      'Laptops',
                      'Tablets',
                      'Headphones',
                    ],
                    initialValue: 'Mobile Phones',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select status';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: defaultPadding / 2),
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Select product',
                    items: const [
                      'Samsung Galaxy S21',
                      'Apple iPhone 12',
                      'Lenovo V15 Pro',
                      'Sony XZ Series 5',
                    ],
                    initialValue: 'Samsung Galaxy S21',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select status';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: 50,
              child: ElevatedButton(
                style: confirmElevatedButtonStyle(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // trigger cubit
                  }
                },
                child: const FittedBox(
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
