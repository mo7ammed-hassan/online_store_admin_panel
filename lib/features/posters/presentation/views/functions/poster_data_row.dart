import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

DataRow posterDataRow({
  required Function()? editOnTap,
  required Function()? deleteOnTap,
}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDkE5-DDlbtsZbGozNNV2w3U5rHbfAcIIkuA&s',
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Text(
                'poster name',
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
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
