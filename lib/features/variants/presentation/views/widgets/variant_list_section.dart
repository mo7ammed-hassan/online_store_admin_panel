import 'package:ecommerce_app_admin_panel/features/variants/presentation/views/functions/variant_data_row.dart';
import 'package:flutter/material.dart';

class VariantListSection extends StatelessWidget {
  const VariantListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Variants",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Variant')),
              DataColumn(label: Text('Variant Type')),
              DataColumn(label: Text('Added Date')),
              DataColumn(label: Text('Edit')),
              DataColumn(label: Text('Delete')),
            ],
            rows: List.generate(
              5,
              (index) => variantDataRow(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
