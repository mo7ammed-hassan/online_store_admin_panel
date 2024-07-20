
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/profile_card.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/search_filed.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(flex: 1),
        Expanded(
          child: SearchField(
            onChange: (value) {},
          ),
        ),
         const ProfileCard()
      ],
    );
  }
}
