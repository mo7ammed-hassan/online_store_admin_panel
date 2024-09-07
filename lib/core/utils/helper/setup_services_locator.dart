import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/repos/category_repo_impl.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/use_cases/category_use_case.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/data_sources/sub_category_remote_data_source.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/repos/sub_category_repo_imp.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/use_cases/sub_category_use_cases.dart';
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
  getIt.registerLazySingleton<CategoryUseCaseImp>(
    () => CategoryUseCaseImp(
      CategoryRepoImpl(
        CategoryRemoteDataSourceImpl(
          getIt.get<ApiService>(),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<SubCategoryUseCaseImpl>(
    () => SubCategoryUseCaseImpl(
      subCategoryRepo: SubCategoryRepoImp(
        SubCategoryRemoteDataSourceImpl(
          getIt.get<ApiService>(),
        ),
      ),
    ),
  );
}
