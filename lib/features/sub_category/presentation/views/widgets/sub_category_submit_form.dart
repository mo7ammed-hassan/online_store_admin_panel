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
  const SubCategorySubmitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryEntity> categories =
        BlocProvider.of<CategoryCubit>(context).categoriesList;
    TextEditingController subCategoryNameController =
        BlocProvider.of<SubCategoryCubit>(context).nameController;
    CategoryEntity? selectedItem =
        BlocProvider.of<SubCategoryCubit>(context).selectedItem;
    GlobalKey<FormState> formKey =
        BlocProvider.of<SubCategoryCubit>(context).formKey;
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
                        if (state is SelectedItemChanged) {
                          return CustomDropdown<CategoryEntity>(
                            onChanged: (newVal) {
                              if (newVal != null) {
                                selectedItem = newVal;
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a Sub Category';
                              }
                              return null;
                            },
                            hintText:
                                state.selectedItem?.name ?? 'Selected category',
                            initialValue: state.selectedItem,
                            items: categories,
                            displayItem: (CategoryEntity? category) =>
                                category?.name ?? '',
                          );
                        } else {
                          return CustomDropdown<CategoryEntity>(
                            onChanged: (newVal) {
                              if (newVal != null) {
                                selectedItem = newVal;
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a Sub Category';
                              }
                              return null;
                            },
                            hintText: selectedItem?.name ?? 'Selected category',
                            initialValue: selectedItem,
                            items: categories,
                            displayItem: (CategoryEntity? category) =>
                                category?.name ?? '',
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomBrandTextFormField(
                      onSaved: (p1) {
                        subCategoryNameController.clear();
                        subCategoryNameController.dispose();
                      },
                      controller: subCategoryNameController,
                      labelText: 'Brand Name',
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
                      BlocProvider.of<SubCategoryCubit>(context).addSubCategory(
                        name: subCategoryNameController.text,
                        categoryId: selectedItem!.id,
                      );
                      Navigator.pop(context);
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
