import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/functions/sub_category_data_row.dart';
import 'package:flutter/material.dart';

class SubCategoryListSection extends StatelessWidget {
  const SubCategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Sub Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("SubCategory Name")),
                DataColumn(label: Text("Category")),
                DataColumn(label: Text("Added Date")),
                DataColumn(label: Text("Edit")),
                DataColumn(label: Text("Delete")),
              ],
              rows: List.generate(
                5,
                (index) {
                  return subCategoryDataRow(
                    editOnTap: () {},
                    deleteOnTap: () {},
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
