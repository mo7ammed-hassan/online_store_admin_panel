import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/notifications/presentation/views/functions/show_add_norification_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/notifications/presentation/views/widgets/notification_list_section.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            const ViewHeader(title: 'Notifications'),
            const SizedBox(
              height: defaultPadding * 1.5,
            ),
            SecoundyViewHeader(
              title: 'My Notifications',
              addNewOnTap: () {
                showAddNotificationAlertDialog(
                  context,
                );
              },
              refreshOnTap: () {},
            ),
            const SizedBox(height: 20),
            const NotificationListSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
