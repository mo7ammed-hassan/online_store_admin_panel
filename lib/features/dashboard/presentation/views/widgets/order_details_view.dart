import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/lists/order_info_list.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/order_info_card.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Orders Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Container(
            height: 150,
            color: Colors.blueGrey,
          ),
          Column(
            children: List.generate(
              orderList.length,
              (index) {
                return OrderInfoCard(
                  orderInfoModel: orderList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
