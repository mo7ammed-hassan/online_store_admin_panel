import 'package:ecommerce_app_admin_panel/core/utils/constants/color_list.dart';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/show_order_form.dart';
import 'package:flutter/material.dart';

class OrderListSection extends StatelessWidget {
  const OrderListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text("Customer Name"),
            ),
            DataColumn(
              label: Text("Order Amount"),
            ),
            DataColumn(
              label: Text("Payment"),
            ),
            DataColumn(
              label: Text("Status"),
            ),
            DataColumn(
              label: Text("Date"),
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
            (index) {
              return orderDataRow(
                index + 1,
                delete: () {
                  //should complete call deleteOrder
                },
                edit: () {
                  showOrderForm(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

DataRow orderDataRow(int index, {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                shape: BoxShape.circle,
              ),
              width: 24,
              height: 24,
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text('user@gmail.com'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text(r'$total'),
      ),
      const DataCell(
        Text('paymentMethod'),
      ),
      const DataCell(
        Text('orderStatus'),
      ),
      DataCell(
        Text(
          DateTime.now().toString(),
        ),
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
