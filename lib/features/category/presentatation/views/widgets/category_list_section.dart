import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_add_category_form.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

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
                categories.length,
                (index) => categoryDataRow(
                  category: categories[index],
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

DataRow categoryDataRow(
    {required CategoryEntity category, Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: category.categoryImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(category.categoryName),
            ),
          ],
        ),
      ),
      DataCell(
        Text(category.createdAt),
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
    ],
  );
}
