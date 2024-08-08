import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/repos/category_repo_impl.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register API service
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  // Register category service
  getIt.registerSingleton<CategoryUseCaseImp>(
    CategoryUseCaseImp(
      CategoryRepoImpl(
        CategoryRemoteDataSourceImpl(
          getIt.get<ApiService>(),
        ),
      ),
    ),
  );
}
