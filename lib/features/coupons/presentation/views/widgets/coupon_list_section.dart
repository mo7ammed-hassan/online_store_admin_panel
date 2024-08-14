import 'package:ecommerce_app_admin_panel/core/widgets/custom_list_section_decoration.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/functions/coupon_data_row.dart';
import 'package:flutter/material.dart';

class CouponListSection extends StatelessWidget {
  const CouponListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListSectionDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Coupons",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Coupon Name')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Edit')),
                DataColumn(label: Text('Delete')),
              ],
              rows: List.generate(
                5,
                (index) => couponDataRow(
                  index: index,
                  editOnTap: () {},
                  deleteOnTap: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
