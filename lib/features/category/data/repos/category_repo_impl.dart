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
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      List<CategoryEntity> categoriesList = await _source.fetchCategories();

      return right(categoriesList);
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
  Future<Either<Failure, CategoryEntity>> addCategory({
    required String name,
    required String imagePath,
  }) async {
    try {
      return right(
        await _source.addCategory(
          name: name,
          imagePath: imagePath,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  }) async {
    try {
      CategoryEntity categoryUpdated = await _source.updateCategory(
        categoryId: categoryId,
        name: name,
        imagePath: imagePath,
      );
      return right(categoryUpdated);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({
    required String categoryId,
  }) async {
    try {
      return right(await _source.deleteCategory(categoryId: categoryId));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
