import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/helper/failure.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/repos/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  final CategoryRemoteDataSourceImpl _source;

  CategoryRepoImpl(this._source);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      List<CategoryEntity> categoryList = await _source.getCategories();

      return right(categoryList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(
      {required String categoryId}) async {
    try {
      CategoryEntity singleCategory =
          await _source.getCategoryById(categoryId: categoryId);
      return right(singleCategory);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCategories(
      {required CategoryEntity category}) async {
    try {
      return right(await _source.addCategories(category: category));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategories(
      {required String categoryId}) async {
    try {
      return right(await _source.deleteCategories(categoryId: categoryId));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategories(
      {required String categoryId,
      required Map<String, dynamic> category}) async {
    try {
      return right(
        await _source.updateCategories(
          categoryId: categoryId,
          category: category,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
