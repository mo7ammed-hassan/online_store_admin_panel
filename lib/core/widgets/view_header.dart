import 'package:ecommerce_app_admin_panel/core/widgets/search_text_field.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ViewHeader extends StatelessWidget {
  const ViewHeader({
    super.key,
    required this.title,
    this.onChanged,
    this.onTap,
  });
  final String title;
  final Function(String)? onChanged;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          child: SearchTextField(
            onTap: onTap,
            onChanged: onChanged,
          ),
        ),
        const ProfileCard(),
      ],
    );
  }
}
