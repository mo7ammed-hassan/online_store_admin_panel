import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_deop_down.dart';
import 'package:flutter/material.dart';

class OrderViewAppBar extends StatelessWidget {
  const OrderViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'My Order',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 280,
          child: CustomDropdown<String>(
            hintText: 'Filter Order By status',
            initialValue: 'All order',
            items: const [
              'All order',
              'pending',
              'processing',
              'shipped',
              'delivered',
              'cancelled'
            ],
            displayItem: (val) => val,
            onChanged: (newValue) {
              if (newValue?.toLowerCase() == 'all order') {
                //should complete call filterOrders
              } else {
                // should complete call filterOrders
              }
            },
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
