import 'package:ecommerce_app_admin_panel/core/utils/constants/color_list.dart';
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';

import 'package:flutter/material.dart';




class CouponListSection extends StatelessWidget {
  const CouponListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Coupons",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child:  DataTable(
                  columnSpacing: defaultPadding,
                  // minWidth: 600,
                  columns: const [
                    DataColumn(
                      label: Text("Coupon Name"),
                    ),
                    DataColumn(
                      label: Text("Status"),
                    ),
                    DataColumn(
                      label: Text("Type"),
                    ),
                    DataColumn(
                      label: Text("Amount"),
                    ),
                    DataColumn(
                      label: Text("Edit"),
                    ),
                    DataColumn(
                      label: Text("Delete"),
                    ),
                  ],
                  rows: List.generate(
                  5,
                    (index) => couponDataRow(
                      
                      index + 1,
                      edit: () {
                     //  showAddCouponForm(context);
                      },
                      delete: () {
                        // should complete call deleteCoupon
                      },
                    ),
                  ),
                ),
              
          ),
        ],
      ),
    );
  }
}

DataRow couponDataRow(int index, {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                shape: BoxShape.circle,
              ),
              child: Text(index.toString(), textAlign: TextAlign.center),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text('coupon'),
            ),
          ],
        ),
      ),
      const DataCell(Text('coupon.status')),
      const DataCell(Text('coup')),
      const DataCell(Text('discountAmount')),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ))),
    ],
  );
}
