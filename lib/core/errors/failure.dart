import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'connection Timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'send Timeout With Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'receive Timeout With Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'bad Certificate With Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.formResponse(
            e.response?.statusCode, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request With Api Server Was Canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Oops There Was An Error , Pleas Try Again');
    }
  }

  factory ServerFailure.formResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          message: 'Your Request Was Not Found, Please Try Later');
    } else if (statusCode == 500) {
      return ServerFailure(
          message: 'There is a problem with server pleas try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 400) {
      return ServerFailure(message: response['error']['message']);
    } else {
      return ServerFailure(
          message: 'Oops There Was An Error , Pleas Try Again');
    }
  }
}
