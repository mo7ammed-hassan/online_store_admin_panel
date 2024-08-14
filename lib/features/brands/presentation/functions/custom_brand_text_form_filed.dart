import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBrandTextFormField extends StatelessWidget {
  const CustomBrandTextFormField({
    super.key,
    this.controller,
    this.onSaved,
    this.validator,
    this.keyboardType,
    required this.labelText,
  });

  final TextEditingController? controller;
  final Function(String? p1)? onSaved;
  final String? Function(String? p1)? validator;
  final TextInputType? keyboardType;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(24),
          labelText: 'Sub Category',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            borderSide: const BorderSide(
              color: secondaryColor,
            ),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
