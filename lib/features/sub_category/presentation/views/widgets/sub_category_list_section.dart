import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/widgets/build_sub_category_list.dart';
import 'package:flutter/material.dart';

class SubCategoryListSection extends StatelessWidget {
  const SubCategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Sub Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            width: double.infinity,
            child: BuildSubCategoryList(),
          ),
        ],
      ),
    );
  }
}
