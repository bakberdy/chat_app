import 'dart:io';

import 'package:chat_app/core/core.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_failure.freezed.dart';

@freezed 
class DioFailure extends Failure with _$DioFailure{
  const DioFailure._();
  const factory DioFailure.unauthorized(String message) = UnauthorizedFailure;
  const factory DioFailure.forbidden(String message) = ForbiddenFailure;
  const factory DioFailure.notFound(String message) = NotFoundFailure;
  const factory DioFailure.internalServerError(String message) = InternalServerErrorFailure;
  const factory DioFailure.serviceUnavailable(String message) = ServiceUnavailableFailure; 
  const factory DioFailure.timeout(String message) = TimeoutFailure;
  const factory DioFailure.unknown(String message) = UnknownServerErrorFailure;
  const factory DioFailure.noInternetConnection(String message) = NoInternetConnectionFailure;
  const factory DioFailure.badRequest(String message) = BadRequestFailure;

  factory DioFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioFailure.timeout(error.message ?? "Connection timed out");
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final detail = error.response?.data['detail'] ?? error.message ?? "Bad response from server";
        if (statusCode == 400) return DioFailure.badRequest(detail);
        if (statusCode == 401) return DioFailure.unauthorized(detail);
        if (statusCode == 403) return DioFailure.forbidden(detail);
        if (statusCode == 404) return DioFailure.notFound(detail);
        if (statusCode == 500) return DioFailure.internalServerError(detail);
        if (statusCode == 503) return DioFailure.serviceUnavailable(detail);
        return DioFailure.unknown(detail);
      case DioExceptionType.cancel:
        return DioFailure.unknown("Request was cancelled");
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return DioFailure.noInternetConnection("No internet connection");
        }
        return DioFailure.unknown(error.message ?? "Unknown error");
      default:
        return DioFailure.unknown(error.message ?? "Unknown Dio error");
    }
  }

  @override
  String get message {
    return switch (this) {
      UnauthorizedFailure(:final message) => message,
      ForbiddenFailure(:final message) => message,
      NotFoundFailure(:final message) => message,
      InternalServerErrorFailure(:final message) => message,
      ServiceUnavailableFailure(:final message) => message,
      TimeoutFailure(:final message) => message,
      UnknownServerErrorFailure(:final message) => message,
      NoInternetConnectionFailure(:final message) => message,
      BadRequestFailure(:final message) => message,
      DioFailure() => "An unknown Dio failure occurred",
    };
  }
}