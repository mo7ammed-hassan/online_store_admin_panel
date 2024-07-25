import 'package:ecommerce_app_admin_panel/features/main/presentation/views/main_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainView(),
    ),
  ],
);


// local data "setstate "
// data in many widget >> state mangement "Global data"