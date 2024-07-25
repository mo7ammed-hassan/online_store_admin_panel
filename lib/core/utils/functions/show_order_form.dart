import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/widgets/order_sumit_frorm.dart';
import 'package:flutter/material.dart';

void showOrderForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(child: Text('Order Details'.toUpperCase(), style: const TextStyle(color: primaryColor))),
        content: const OrderSubmitForm(),
      );
    },
  );
}