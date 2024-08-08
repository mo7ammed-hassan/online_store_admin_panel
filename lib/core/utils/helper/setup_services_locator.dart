import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

void setupServiceLocator() {
  gitIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
}
