import 'package:ecommerce_app_admin_panel/features/main/presentation/views/manager/cubits/main_view_cubit/main_view_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: SideMenu(),
              ),
              BlocBuilder<MainViewCubit, MainViewState>(
                builder: (context, state) {
                  return Expanded(
                    flex: 5,
                    child: state.selectedView,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
