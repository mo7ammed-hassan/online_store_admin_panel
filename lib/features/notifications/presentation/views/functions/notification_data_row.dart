import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

DataRow notificationDataRow({
  required Function()? deleteOnTap,
  required Function()? viewOnTap,
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
                24,
                190,
                250,
                index * 0.2,
              ),
              child: Text('${index + 1}'),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text('title'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text('my notification description'),
      ),
      const DataCell(
        Text('send date'),
      ),
      DataCell(
        IconButton(
          onPressed: viewOnTap,
          icon: const Icon(
            Icons.visibility,
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


