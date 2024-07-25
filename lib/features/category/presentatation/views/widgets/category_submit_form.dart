import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/cancel_and_submit_bottons_form.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_text_filed.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_image_card.dart';
import 'package:flutter/material.dart';

class CategorySubmitForm extends StatelessWidget {
  const CategorySubmitForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: defaultPadding),
              const ProductImageCard(),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                labelText: 'Category Name',
                onSave: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Category name is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding * 2),
              CancleAndSubmitFormBottons(onPressedSubmit: () {})
            ],
          ),
        ),
      ),
    );
  }
}