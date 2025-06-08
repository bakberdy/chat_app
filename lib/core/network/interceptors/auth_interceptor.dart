import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() _getAccessToken;
  final Future<String?> Function() _getRefreshToken;
  final Future<void> Function(String refreshToken) _refreshTokens;

  AuthInterceptor(this._getAccessToken, this._getRefreshToken, this._refreshTokens);
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final shouldAttach = options.extra['enableAuthInterceptor'] == true;

    if(shouldAttach){if (err.response?.statusCode == 401) {
      final refreshToken = await _getRefreshToken();
      if (refreshToken != null) {
        try {
          
          await _refreshTokens(refreshToken);
          // Retry the request with the new access token
          final accessToken = await _getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          final response = await Dio().fetch(options);
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: e,
            type: DioExceptionType.unknown,
          ));
        }
      }
      
    }}
    handler.next(err); 
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final accessToken = await _getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }
}