import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/profile_card.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/search_filed.dart';
import 'package:flutter/material.dart';

class MainViewsHeader extends StatelessWidget {
  const MainViewsHeader(
      {super.key, required this.title, required this.onChange});
  final String title;
  final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(flex: 1),
        Expanded(
          child: SearchField(
            onChange: onChange,
          ),
        ),
        const ProfileCard()
      ],
    );
  }
}
