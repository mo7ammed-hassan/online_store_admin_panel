import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/functions/format_date.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

DataRow categoyDataRow({
  CategoryEntity? category,
  required Function()? editOnTap,
  required Function()? deleteOnTap,
}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: category!.categoryImage,
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  color: bgColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: 38,
              width: 38,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Text(
                category.categoryName,
                style: const TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      ),
      DataCell(
        Text(
          formatDate(category.createdAt),
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
          onPressed: deleteOnTap,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    ],
  );
}
