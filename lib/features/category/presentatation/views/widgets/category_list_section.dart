import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/functions/category_data_row.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/functions/show_edit_category_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({super.key, required this.categories});
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Category Name")),
                DataColumn(label: Text("Added Date")),
                DataColumn(label: Text("Edit")),
                DataColumn(label: Text("Delete")),
              ],
              rows: List.generate(
                categories.length,
                (index) => categoyDataRow(
                  category: categories[index],
                  editOnTap: () {
                    showEditCategoryAlertDialog(
                      context,
                      category: categories[index],
                    );
                  },
                  deleteOnTap: () async {
                    final cubit = context.read<CategoryCubit>();
                    await cubit.deleteCategory(
                      categoryId: categories[index].id,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
