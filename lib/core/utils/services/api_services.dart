import 'package:dio/dio.dart';

import 'package:ecommerce_app_admin_panel/core/utils/constants/api_constants.dart';

class ApiService {
  final Dio dio;
  ApiService(
    this.dio,
  );

  // get items
  Future<Map<String, dynamic>> getItems({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  // get item by id
  Future<Map<String, dynamic>> getItemById(
      {required String endPoint, required String itemId}) async {
    Response response = await dio.get('$baseUrl$endPoint/$itemId');
    return response.data;
  }

  //add items
  Future<Map<String, dynamic>> addItem({
    required String endPoint,
    required FormData itemData,
  }) async {
    Response response = await dio.post(
      '$baseUrl$endPoint',
      data: itemData,
    );

    return response.data;
  }

  // update items
  Future<Map<String, dynamic>> updateItem({
    required String endPoint,
    required itemId,
    required FormData itemData,
  }) async {
    Response response =
        await dio.put('$baseUrl$endPoint/$itemId', data: itemData);
    return response.data;
  }

  // delete items
  Future<Map<String, dynamic>> deleteItem(
      {required String endPoint, required itemId}) async {
    Response response = await dio.delete('$baseUrl$endPoint/$itemId');
    return response.data;
  }
}
