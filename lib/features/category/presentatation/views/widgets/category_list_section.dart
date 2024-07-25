import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_add_category_form.dart';
import 'package:flutter/material.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({super.key});

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
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text("Category Name"),
                ),
                DataColumn(
                  label: Text("Added Date"),
                ),
                DataColumn(
                  label: Text("Edit"),
                ),
                DataColumn(
                  label: Text("Delete"),
                ),
              ],
              rows: List.generate(
                4,
                (index) => categoryDataRow(
                  delete: () {},
                  edit: () {
                    showAddCategoryForm(context);
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

DataRow categoryDataRow({Function? edit, Function? delete}) {
  return DataRow(cells: [
    DataCell(
      Row(
        children: [
          Image.asset(
            'assets/category/electronics.png',
            height: 30,
            width: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text('Electronics'),
          ),
        ],
      ),
    ),
    DataCell(
      Text(DateTime.now().toString()),
    ),
    DataCell(
      IconButton(
        onPressed: () {
          if (edit != null) edit();
        },
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    ),
    DataCell(
      IconButton(
        onPressed: () {
          if (delete != null) delete();
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    ),
  ]);
}
