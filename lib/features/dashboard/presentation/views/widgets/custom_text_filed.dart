import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
     this.maxLine,
    this.keyboardType,
    required this.onSave,
    this.validator,
  });
  final TextEditingController? controller;
  final String labelText;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Function(String?) onSave;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: secondaryColor,
            ),
          ),
          labelText: labelText,
        ),
        keyboardType: keyboardType,
        onSaved: (newValue) {
          onSave(newValue?.isEmpty ?? true ? null : newValue);
        },
        validator: validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(700),
          if (keyboardType == TextInputType.number)
            FilteringTextInputFormatter.allow(
              RegExp(
                r'^-?\d*\.?\d*',
              ),
            ),
        ],
      ),
    );
  }
}
