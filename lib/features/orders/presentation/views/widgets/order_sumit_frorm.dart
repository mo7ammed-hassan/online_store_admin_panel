import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/widgets/custom_drop_down.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class OrderSubmitForm extends StatelessWidget {
  const OrderSubmitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: size.width * 0.5, // Adjust width based on screen size
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Form(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            children: [
              Expanded(
                  child: formRow('Name:',
                      const Text('N/A', style: TextStyle(fontSize: 16)))),
              Expanded(
                  child: formRow('Order Id:',
                      const Text('N/A', style: TextStyle(fontSize: 12)))),
            ],
          ),
          itemsSection(),
          addressSection(),
          const SizedBox(
            width: 10,
          ),
          paymentDetailsSection(),
          formRow(
              'Order Status:',
              CustomDropdown(
                hintText: 'Status',
                initialValue: 'selectedOrderStatus',
                items: const [
                  'pending',
                  'processing',
                  'shipped',
                  'delivered',
                  'cancelled'
                ],
                onChanged: (newValue) {},
                validator: (value) {
                  if (value == null) {
                    return 'Please select status';
                  }
                  return null;
                },
              )),
          formRow(
            'Tracking URL:',
            CustomTextField(
              labelText: 'Tracking Url',
              onSave: (val) {},
            ),
          ),
          const SizedBox(
            width: 10 * 2,
          ),
          actionButtons(context),
        ]),
      ),
    ));
  }

  Widget formRow(String label, Widget dataWidget) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16))),
          Expanded(flex: 2, child: dataWidget),
        ],
      ),
    );
  }

  Widget addressSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor, // Light grey background to stand out
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: Colors.blueAccent), // Blue border for emphasis
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Shipping Address',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
          formRow('Phone:', const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow('Street:', const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow('City:', const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow('Postal Code:',
              const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow(
              'Country:', const Text('N/A', style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget paymentDetailsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blueAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Payment Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          formRow('Payment Method:',
              const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow('Coupon Code:',
              const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow('Order Sub Total:',
              const Text('N/A', style: TextStyle(fontSize: 16))),
          formRow(
              'Discount:',
              const Text('N/A',
                  style: TextStyle(fontSize: 16, color: Colors.red))),
          formRow(
              'Grand Total:',
              const Text('\$N/A',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget itemsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blueAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Items',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          _buildItemsList(),
          const SizedBox(
              height:
                  defaultPadding), // Add some spacing before the total price
          formRow(
            'Total Price:',
            const Text('N/A',
                style: TextStyle(fontSize: 16, color: Colors.green)),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling within ListView
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 4.0), // Add spacing between items
          child: Text('rtt', style: TextStyle(fontSize: 16)),
        );
      },
    );
  }

  Widget actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

// How to show the order popup
void showOrderForm(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Order Details'.toUpperCase(),
                style: const TextStyle(color: primaryColor))),
        content: const OrderSubmitForm(),
      );
    },
  );
}
