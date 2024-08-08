import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  // Failure from dio
  factory ServerFailure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('asend Timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with api server');
      case DioExceptionType.badResponse: // req stell work with api server
        return ServerFailure.fromResponse(dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to apiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('There was an error, please try again later.');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 500) {
      return ServerFailure(
        'There was a problem with server, plese try again later',
      );
    } else if (response.statusCode == 404) {
      return ServerFailure(
        'Your Request was not found, please try later.',
      );
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ServerFailure(response.data['message']);
    }
    return ServerFailure('There was an error, please try again.');
  }
}
