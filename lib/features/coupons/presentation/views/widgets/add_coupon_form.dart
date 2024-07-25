// import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
// import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_deop_down.dart';
// import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/custom_text_filed.dart';

// import '../../../models/product.dart';
// import '../../../models/sub_category.dart';
// import '../provider/coupon_code_provider.dart';
// import '../../../utility/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';
// import '../../../models/category.dart';
// import '../../../models/coupon.dart';
// import '../../../utility/constants.dart';
// import '../../../widgets/custom_date_picker.dart';
// import '../../../widgets/custom_dropdown.dart';
// import '../../../widgets/custom_text_field.dart';

// class CouponSubmitForm extends StatelessWidget {
//   final Coupon? coupon;

//   const CouponSubmitForm({Key? key, this.coupon}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     context.couponCodeProvider.setDataForUpdateCoupon(coupon);
//     return SingleChildScrollView(
//       child: Form(
//         key: context.couponCodeProvider.addCouponFormKey,
//         child: Container(
//           width: size.width * 0.7,
//           padding: EdgeInsets.all(defaultPadding),
//           decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Gap(defaultPadding),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextField(
//                       controller: context.couponCodeProvider.couponCodeCtrl,
//                       labelText: 'Coupon Code',
//                       onSave: (val) {},
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter coupon code';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: CustomDropdown(
//                       key: GlobalKey(),
//                       hintText: 'Discount Type',
//                       items: ['fixed', 'percentage'],
//                       initialValue:
//                           context.couponCodeProvider.selectedDiscountType,
//                       onChanged: (newValue) {
//                         context.couponCodeProvider.selectedDiscountType =
//                             newValue ?? 'fixed';
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a discount type';
//                         }
//                         return null;
//                       },
//                       displayItem: (val) => val,
//                     ),
//                   ),
//                 ],
//               ),
//               Gap(defaultPadding),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextField(
//                       controller: context.couponCodeProvider.discountAmountCtrl,
//                       labelText: 'Discount Amount',
//                       inputType: TextInputType.number,
//                       onSave: (val) {},
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter discount amount';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: CustomTextField(
//                       controller:
//                           context.couponCodeProvider.minimumPurchaseAmountCtrl,
//                       labelText: 'Minimum Purchase Amount',
//                       inputType: TextInputType.number,
//                       onSave: (val) {},
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select status';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Gap(defaultPadding),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomDatePicker(
//                       labelText: 'Select Date',
//                       controller: context.couponCodeProvider.endDateCtrl,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100),
//                       onDateSelected: (DateTime date) {
//                         print('Selected Date: $date');
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: CustomDropdown(
//                       key: GlobalKey(),
//                       hintText: 'Status',
//                       initialValue:
//                          'selectedCouponStatus',
//                       items: ['active', 'inactive'],
//                       displayItem: (val) => val,
//                       onChanged: (newValue) {
//                         'active';
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select status';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child:CustomDropdown(
//                           initialValue: 'selectedCategory',
//                           hintText: 'Select category',
//                           items: [],
//                           displayItem: (category) =>
//                               category?.name ?? '',
//                           onChanged: (newValue) {
                            
//                           },
//                         ),
                     
//                   ),
//                   Expanded(
//                     child: CustomDropdown(
//                       initialValue: 'selectedSubCategory',
//                       hintText: 'Select sub category',
//                       items: [],
//                       displayItem: (subCategory) => subCategory?.name ?? '',
//                       onChanged: (newValue) {},
//                     ),
//                   ),
//                   Expanded(
//                     child: CustomDropdown(
//                       initialValue: 'selectedProduct',
//                       hintText: 'Select product',
//                       items: ['selected', 'selected'],
//                       displayItem: (value) => value,
//                       onChanged: (newValue) {},
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: defaultPadding),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: secondaryColor,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Close the popup
//                     },
//                     child: Text('Cancel'),
//                   ),
//                   SizedBox(width: defaultPadding),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: primaryColor,
//                     ),
//                     onPressed: () {
//                       // Validate and save the form
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // How to show the popup
// void showAddCouponForm(
//   BuildContext context,
// ) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: bgColor,
//         title: Center(
//             child: Text('Add Coupon'.toUpperCase(),
//                 style: TextStyle(color: primaryColor))),
//         content: CouponSubmitForm(),
//       );
//     },
//   );
// }
