import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

DataRow orderDataRow({
  required Function()? editOnTap,
  required Function()? deleteOnTap,
  required int index,
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
                211,
                index * 0.2,
              ),
              child: Text('${index + 1}'),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text('user@gmail.com'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text('11000.0'),
      ),
      const DataCell(
        Text('prepaid'),
      ),
      const DataCell(
        Text('shipped'),
      ),
      const DataCell(
        Text(
          'formatDate(category.createdAt)',
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
