import 'package:chat_app/core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

@singleton
class DioClient {
  /// A Dio client for making HTTP requests with authentication and logging.
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final TalkerDioLogger _talkerDioLogger;

  late final AuthInterceptor _authInterceptor;

  DioClient(this._dio, this._tokenStorage, this._talkerDioLogger) : super() {
    //initialize dio
    _dio.options.baseUrl = ApiEndpoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.sendTimeout = const Duration(seconds: 10);

    _authInterceptor = AuthInterceptor(
      _tokenStorage.getAccessToken,
      _tokenStorage.getRefreshToken,
      (String refreshToken) async {
        final response = await _dio.post(ApiEndpoints.refreshToken,
            data: {'refresh_token': refreshToken});
        if (response.statusCode == 200) {
          final data = response.data;
          await _tokenStorage.saveAccessToken(data['access_token']);
          await _tokenStorage.saveRefreshToken(data['refresh_token']);
        } else {
          throw Exception('Failed to refresh tokens');
        }
      },
    );
    //add interceptors
    _dio.interceptors
      ..add(_talkerDioLogger)
      ..add(_authInterceptor);
  }

  // Public methods to make requests
  Future<Response<T>> request<T>(String path,
      {String method = 'GET',
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) {
    options ??= Options(method: method);
    return _dio.request<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.get<T>(path,
        queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.post<T>(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.put<T>(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> delete<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.delete<T>(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> patch<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.patch<T>(path,
        data: data, queryParameters: queryParameters, options: options);
  }
}
