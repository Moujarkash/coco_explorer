import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:dio/dio.dart';

/// Extension for [DioError]
/// Used to convert dioError into [Failure]
extension DioErrorExtension on DioError {
  ///
  Failure get toFailure {
    if (error is Failure) {
      return error as Failure;
    }

    var msg = message;

    FailureType failureType;
    int? statusCode;

    switch (type) {
      case DioErrorType.cancel:
        failureType = FailureType.cancel;
        break;

      case DioErrorType.connectTimeout:
        failureType = FailureType.requestTimeout;
        break;

      case DioErrorType.receiveTimeout:
        failureType = FailureType.responseTimeout;
        break;

      case DioErrorType.response:
        failureType = FailureType.response;
        statusCode = response?.statusCode ?? FailureType.response.code;
        break;

      case DioErrorType.sendTimeout:
      case DioErrorType.other:
        failureType = FailureType.unknown;
        statusCode = response?.statusCode ?? FailureType.unknown.code;
        msg = 'Something went wrong. Please try again.';
        break;

    }

    return Failure(msg, failureType, statusCode);
  }
}