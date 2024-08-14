import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/posters/presentation/views/functions/poster_data_row.dart';
import 'package:flutter/material.dart';

class PostersListSection extends StatelessWidget {
  const PostersListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Posters",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Poster Name')),
                DataColumn(label: Text('Edit')),
                DataColumn(label: Text('Delete')),
              ],
              rows: List.generate(
                5,
                (index) => posterDataRow(
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
