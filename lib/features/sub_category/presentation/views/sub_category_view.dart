import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/secoundry_view_header.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/view_header.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';

import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/functions/show_add_sub_category_alert_dialog.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/widgets/sub_category_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        primary: false,
        child: Column(
          children: [
            ViewHeader(
              onChanged: (item) {},
              onTap: () {
                BlocProvider.of<SubCategoryCubit>(context)
                    .searchForItem('Apple');
              },
              title: 'Sub Category',
            ),
            const SizedBox(height: defaultPadding * 1.5),
            SecoundyViewHeader(
              title: 'My Sub Categories',
              addNewOnTap: () {
                showAddSubCategoryAlertDialog(context);
              },
              refreshOnTap: () async {
                // triger gell all sub categories
              },
            ),
            const SizedBox(height: 20),
            const SubCategoryListSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
