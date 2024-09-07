import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/data_sources/sub_category_remote_data_source.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/sub_category_data.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/repos/sub_category_repo.dart';

class SubCategoryRepoImp extends SubCategoryRepo {
  final SubCategoryRemoteDataSourceImpl _dataSource;

  SubCategoryRepoImp(this._dataSource);
  @override
  Future<Either<Failure, List<Data>>> fetchSubCategories() async {
    try {
      List<Data> subCategoies =
          await _dataSource.fetchSubCategories();
      return right(subCategoies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> getSubCategoryById(
      String subCategoryId) async {
    try {
      SubCategoryEntity subCategory =
          await _dataSource.getSubCategoryById(subCategoryId: subCategoryId);
      return right(subCategory);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> addSubCategory(
      {required String name, required String categoryId}) async {
    try {
      return right(
        await _dataSource.addSubCategory(name: name, categoryId: categoryId),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, SubCategoryEntity>> updateSubCategory({
    required String name,
    required String categoryId,
    required String subCategoryId,
  }) async {
    try {
      return right(
        await _dataSource.updateSubCategory(
          name: name,
          categoryId: categoryId,
          subCategoryId: subCategoryId,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteSubCategory(String subCategoryId) async {
    try {
      await _dataSource.deleteSubCategory(subCategoryId: subCategoryId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
