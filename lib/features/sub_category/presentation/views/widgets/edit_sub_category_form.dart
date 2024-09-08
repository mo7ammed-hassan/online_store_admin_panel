import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/styles/confirm_eleveted_button_style.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/alert_dialog_content_decoration.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/functions/custom_brand_text_form_filed.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSubCategorySubmitForm extends StatelessWidget {
  const EditSubCategorySubmitForm({
    super.key,
    required this.subCategoryEntity,
  });
  final SubCategoryEntity subCategoryEntity;

  @override
  Widget build(BuildContext context) {
    List<CategoryEntity> categories =
        BlocProvider.of<CategoryCubit>(context).categoriesList;
    final subCategoryCubit = BlocProvider.of<SubCategoryCubit>(context);

    TextEditingController subCategoryNameController =
        TextEditingController(text: subCategoryEntity.name);

    CategoryEntity? selectedItem = subCategoryCubit.selectedItem;

    subCategoryCubit.updateSelectedItem(selectedItem);

    GlobalKey<FormState> formKey = subCategoryCubit.formKey;

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
                    child: CustomDropdown<CategoryEntity>(
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
                      hintText: selectedItem?.name ?? subCategoryEntity.name,
                      initialValue: selectedItem,
                      items: categories,
                      displayItem: (CategoryEntity? category) =>
                          category?.name ?? '',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomBrandTextFormField(
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
                    if (subCategoryNameController.text.isNotEmpty) {
                      subCategoryCubit.updateSubCategory(
                        subCategoryId: subCategoryEntity.id,
                        name: subCategoryNameController.text,
                        categoryId: selectedItem?.id ?? subCategoryEntity.categoryId.id!,
                      );

                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a category to update.'),
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
