import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/notifications/presentation/views/functions/notification_data_row.dart';
import 'package:flutter/material.dart';

class NotificationListSection extends StatelessWidget {
  const NotificationListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Notifications",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Title'),
                ),
                DataColumn(label: Text('Description')),
                DataColumn(label: Text('Send Date')),
                DataColumn(label: Text('View')),
                DataColumn(label: Text('Delete')),
              ],
              rows: List.generate(
                5,
                (index) => notificationDataRow(
                  index: index,
                  viewOnTap: () {},
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
