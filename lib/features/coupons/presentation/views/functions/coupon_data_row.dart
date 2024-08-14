import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

DataRow couponDataRow({
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
                66,
                65,
                index * 0.2,
              ),
              child: Text('${index + 1}'),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text('Coupon Name'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text(
          'active',
        ),
      ),
      const DataCell(
        Text(
          'fixed',
        ),
      ),
      const DataCell(
        Text(
          '30.0',
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
