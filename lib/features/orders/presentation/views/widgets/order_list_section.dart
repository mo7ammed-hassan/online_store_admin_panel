import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/functions/order_data_row.dart';
import 'package:flutter/material.dart';

class OrderListSection extends StatelessWidget {
  const OrderListSection({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Order",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Customer Name")),
                DataColumn(label: Text("Order Amount")),
                DataColumn(label: Text("Payment")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Edit")),
                DataColumn(label: Text("Delete")),
              ],
              rows: List.generate(
                5,
                (index) => orderDataRow(
                  index: index,
                  editOnTap: () {},
                  deleteOnTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
