import 'dart:io';

import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/posters/presentation/views/functions/show_add_poster_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/posters/presentation/views/widgets/posters_list_section.dart';
import 'package:flutter/material.dart';

class PosterView extends StatelessWidget {
  const PosterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const ViewHeader(title: 'Posters'),
          const SizedBox(height: defaultPadding * 1.5),
          SecoundyViewHeader(
            title: 'My Posters',
            addNewOnTap: () {
              showAddPosterAlertDialog(
                context,
                onSubmit: (String categoryName, File? image) {
                  // trigger Cubit
                },
              );
            },
            refreshOnTap: () {},
          ),
          const SizedBox(height: 20),
          const PostersListSection(),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
