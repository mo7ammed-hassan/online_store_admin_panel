import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/functions/show_edit_sub_category_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/functions/sub_category_data_row.dart';
import 'package:flutter/material.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({
    super.key,
    required this.subCategories,
  });
  final List<SubCategoryEntity> subCategories;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("SubCategory Name")),
        DataColumn(label: Text("Category")),
        DataColumn(label: Text("Added Date")),
        DataColumn(label: Text("Edit")),
        DataColumn(label: Text("Delete")),
      ],
      rows: List.generate(
        subCategories.length,
        (index) {
          return subCategoryDataRow(
            subCategory: subCategories[index],
            editOnTap: () {
              showEditSubCategoryAlertDialog(
                context,
                subCategoryEntity: subCategories[index],
              );
            },
            context: context,
            index: index,
          );
        },
      ),
    );
  }
}
