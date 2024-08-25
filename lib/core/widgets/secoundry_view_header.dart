import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/setup_services_locator.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecoundyViewHeader extends StatelessWidget {
  const SecoundyViewHeader({
    super.key,
    required this.title,
    this.addNewOnTap,
    this.refreshOnTap,  
  });
  final String title;
  final Function()? addNewOnTap;
  final Function()? refreshOnTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt.get<CategoryUseCaseImp>()),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          GestureDetector(
            onTap: addNewOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text('Add New'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: refreshOnTap,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
