import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.controller,
    required this.onDateSelected,
    required this.initialDate,
    required this.labelText,
  });
  final String labelText;
  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController controller;
  final DateTime initialDate;
  final void Function(DateTime) onDateSelected;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: secondaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != widget.initialDate) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(24),
        labelText: widget.labelText,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }
}
