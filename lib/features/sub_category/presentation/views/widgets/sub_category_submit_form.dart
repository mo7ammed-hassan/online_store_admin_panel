import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/functions/custom_brand_text_form_filed.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategorySubmitForm extends StatelessWidget {
  const SubCategorySubmitForm({super.key});

  @override
  Widget build(BuildContext context) {
    final subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    final categories = categoryCubit.categoriesList;
    final formKey = subCategoryCubit.formKey;
    final subCategoryNameController = subCategoryCubit.nameController;
    final selectedItem = subCategoryCubit.selectedItem;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: AlertDialogContentDecoration(
          widthValue: 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: defaultPadding * 2),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
                      builder: (context, state) {
                        CategoryEntity? dropdownSelectedItem = selectedItem;
                        if (state is SelectedItemChanged) {
                          dropdownSelectedItem = state.selectedItem;
                        }

                        return CustomDropdown<CategoryEntity>(
                          onChanged: (newVal) {
                            if (newVal != null) {
                              subCategoryCubit.updateSelectedItem(newVal);
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a category';
                            }
                            return null;
                          },
                          hintText: dropdownSelectedItem?.name ?? 'Select a category',
                          initialValue: dropdownSelectedItem,
                          items: categories,
                          displayItem: (CategoryEntity? category) => category?.name ?? '',
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomBrandTextFormField(
                      onSaved: (value) {
                        subCategoryNameController.clear();
                        subCategoryNameController.dispose();
                      },
                      controller: subCategoryNameController,
                      labelText: 'Sub Category Name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              ElevatedButton(
                style: confirmElevatedButtonStyle(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (subCategoryNameController.text.isNotEmpty && selectedItem != null) {
                      subCategoryCubit.addSubCategory(
                        name: subCategoryNameController.text,
                        categoryId: selectedItem!.id,
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a category.'),
                        ),
                      );
                    }
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
      ),
    );
  }
}
