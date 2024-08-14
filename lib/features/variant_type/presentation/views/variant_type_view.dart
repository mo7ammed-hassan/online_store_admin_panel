import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/variant_type/presentation/views/functions/show_add_variant_type_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/variants/presentation/views/widgets/variant_list_section.dart';
import 'package:flutter/material.dart';

class VariantTypeView extends StatelessWidget {
  const VariantTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            const ViewHeader(title: 'Variants Type'),
            const SizedBox(height: defaultPadding * 1.5),
            SecoundyViewHeader(
              title: 'My Variant Types',
              addNewOnTap: () {
                showAddVariantTypeAlertDialog(context);
              },
              refreshOnTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const VariantListSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
