import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/functions/brand_data_row.dart';
import 'package:flutter/material.dart';

class BrandListSection extends StatelessWidget {
  const BrandListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Brands",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Brand Name')),
                DataColumn(label: Text('Sub Category')),
                DataColumn(label: Text('Added Date')),
                DataColumn(label: Text('Edit')),
                DataColumn(label: Text('Delete')),
              ],
              rows: List.generate(
                5,
                (index) => brandDataRow(
                  index: index,
                  editOnTap: () {},
                  deleteOnTap: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
