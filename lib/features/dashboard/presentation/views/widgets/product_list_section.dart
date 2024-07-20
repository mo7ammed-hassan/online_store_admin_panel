import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Text(
            "All Products",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text("Product Name"),
                ),
                DataColumn(
                  label: Text("Category"),
                ),
                DataColumn(
                  label: Text("Sub Category"),
                ),
                DataColumn(
                  label: Text("Price"),
                ),
                DataColumn(
                  label: Text("Edit"),
                ),
                DataColumn(
                  label: Text("Delete"),
                ),
              ],
              rows: List.generate(
                10,
                (index) => productDataRow(
                  edit: () {
                    //showAddProductForm(context, dataProvider.products[index]);
                  },
                  delete: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow productDataRow({Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              'assets/images/image18.png',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text('Product name'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text('name'),
      ),
      const DataCell(
        Text('SubCategory'),
      ),
      const DataCell(
        Text('price'),
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
