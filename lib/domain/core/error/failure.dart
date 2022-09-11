import 'package:coco_explorer/infrastructure/core/extensions/dio_error_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Custom object for handling failures and exceptions
class Failure extends Error {
  ///
  /// String representation of [Failure] reason
  ///
  final String reason;

  ///
  /// Use [type] for checking condition
  ///
  final FailureType type;

  ///
  /// [code] is for logging, not to check failure condition
  ///
  final int? code;

  Failure(this.reason, this.type, [this.code]);

  /// Convert exception to [Failure]
  factory Failure.fromException(Object e) {
    if (e is DioError) {
      return e.toFailure;
    }

    debugPrint(e.toString());
    return Failure(
      e.toString(),
      FailureType.exception,
    );
  }
}

/// Different failure type
class FailureType {
  final int code;

  const FailureType._internal(this.code);

  /// Authentication failure [code] : -4
  static const FailureType authentication = FailureType._internal(-4);

  /// Failure caused by exceptions [code] : -3
  static const FailureType exception = FailureType._internal(-3);

  /// Unknown failure [code] : -2
  static const FailureType unknown = FailureType._internal(-2);

  /// No internet connection [code] : -1
  static const FailureType internet = FailureType._internal(-1);

  /// Request cancel [code] : 0
  static const FailureType cancel = FailureType._internal(0);

  /// Request time out [code] : 408
  static const FailureType requestTimeout = FailureType._internal(408);

  /// Response time out [code] : 598
  static const FailureType responseTimeout = FailureType._internal(598);

  ///
  /// Response failure
  ///
  /// Code inside [Failure] might be different
  /// if response status code is available.
  ///
  /// Default [code] for response failure is 400
  static const FailureType response = FailureType._internal(400);
}