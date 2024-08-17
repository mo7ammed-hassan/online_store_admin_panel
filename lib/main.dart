
import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/setup_services_locator.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/simple_bloc_observer.dart';
import 'package:ecommerce_app_admin_panel/core/utils/routers/app_router.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/manager/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(
    const OnlineStore(),
  );
}

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryCubit(
        getIt.get<CategoryUseCaseImp>(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ECommerce Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
          ),
          canvasColor: secondaryColor,
        ),
        routerConfig: router,
      ),
    );
  }
}
