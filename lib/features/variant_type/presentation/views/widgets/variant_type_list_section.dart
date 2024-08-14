import 'package:ecommerce_app_admin_panel/features/variant_type/presentation/views/functions/variant_type_data_row.dart';
import 'package:flutter/material.dart';

class VariantTypeListSection extends StatelessWidget {
  const VariantTypeListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Variants Type",
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
              (index) => varianttypeDataRow(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
