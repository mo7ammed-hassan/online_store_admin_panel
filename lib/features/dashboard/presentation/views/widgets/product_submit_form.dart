import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/cancel_and_submit_bottons_form.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_deop_down.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_text_filed.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/multi_selected_drop_down.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_image_card.dart';
import 'package:flutter/material.dart';

class ProductSubmitForm extends StatelessWidget {
  const ProductSubmitForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          width: MediaQuery.sizeOf(context).width * 0.7,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) {
                      return const ProductImageCard();
                    },
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                labelText: 'Product name',
                maxLine: 1,
                onSave: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                labelText: 'Product Description',
                maxLine: 3,
                onSave: (val) {},
              ),
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      hintText: 'Select category',
                      items: const ['category', 'value'],
                      onChanged: (newValue) {
                        if (newValue != null) {}
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      displayItem: (String val) {
                        return val;
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomDropdown(
                      hintText: 'Sub category',
                      displayItem: (val) {
                        return val.toString();
                      },
                      onChanged: (newValue) {
                        if (newValue != null) {}
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select sub category';
                        }
                        return null;
                      },
                      items: const ['1', '2', '3'],
                    ),
                  ),
                  Expanded(
                    child: CustomDropdown(
                      items: const ['1', '2', '3', '4', '5'],
                      hintText: 'Select Brand',
                      displayItem: (value) {
                        return value.toString();
                      },
                      onChanged: (newValue) {
                        if (newValue != null) {}
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please brand';
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
                    child: CustomTextField(
                      labelText: 'Price',
                      keyboardType: TextInputType.number,
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter price';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Offer price',
                      keyboardType: TextInputType.number,
                      onSave: (val) {},
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Quantity',
                      keyboardType: TextInputType.number,
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      items: const ['a', 'b', 'c'],
                      displayItem: (String? variantType) => variantType!,
                      onChanged: (newValue) {
                        if (newValue != null) {}
                      },
                      hintText: 'Select Variant type',
                    ),
                  ),
                  Expanded(
                    child: MultiSelectDropDown(
                      items: const ['Variant', 'Type'],
                      onSelectionChanged: (newValue) {},
                      displayItem: (String item) => item,
                      selectedItems: const ['Vari', 'Type'],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              CancleAndSubmitFormBottons(
                onPressedSubmit: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

