import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/format_date.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/manager/cubit/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DataRow subCategoryDataRow({
  required Function()? editOnTap,
  required int index,
  required SubCategoryEntity subCategory,
  required context,
}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Color.fromRGBO(
                245,
                152,
                255,
                index * 0.2,
              ),
              child: Text('${index + 1}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(subCategory.name),
            ),
          ],
        ),
      ),
      DataCell(
        Text(subCategory.categoryId.name ?? ''),
      ),
      DataCell(
        Text(
          formatDate(subCategory.createdAt),
        ),
      ),
      DataCell(
        IconButton(
          onPressed: editOnTap,
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        IconButton(
          onPressed: () async {
            await BlocProvider.of<SubCategoryCubit>(context)
                .deleteSubCategory(subCategory.id);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    ],
  );
}
