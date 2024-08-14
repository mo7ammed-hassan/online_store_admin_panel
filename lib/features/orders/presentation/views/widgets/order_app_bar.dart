import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            'My Order',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          flex: 1,
          child: CustomDropdown<String>(
            hintText: 'Filter Order By status',
            initialValue: 'All orders',
            onChanged: (newValue) {
              if (newValue?.toLowerCase() == 'all order') {
                //should complete call filterOrders
              } else {
                // should complete call filterOrders
              }
            },
            items: const [
              'All orders',
              'Pending',
              'Processing',
              'Shipped',
              'Delivered',
              'Cancelled',
            ],
            validator: (value) {
              if (value == null) {
                return 'Please select status';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 40),
        IconButton(
          onPressed: () {
            // should complete call getAllOrders
          },
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
