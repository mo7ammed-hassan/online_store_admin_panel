import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

DataRow variantDataRow({
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
                199,
                index * 0.2,
              ),
              child: Text('${index + 1}'),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text('Variant Name'),
            ),
          ],
        ),
      ),
      const DataCell(
        Text(
          'TV Size',
        ),
      ),
      const DataCell(
        Text(
          'formatDate(date)',
        ),
      ),
      DataCell(
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    ],
  );
}
