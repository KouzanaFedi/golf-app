import 'package:dio/dio.dart';

class Client {
  static Client _instance;
  String _token;

  void setToken(String token) {
    this._token = token;
  }

  static Client getInstance() {
    if (_instance == null) _instance = Client();
    return _instance;
  }

  // dio instance
  final Dio _dio = Dio();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String url, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      if (this._token != null) {
        if (options != null) {
          options.headers["Authorization"] = "Bearer $_token";
        } else
          options = Options(
              headers: {"Authorization": "Bearer $_token"},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              });
      }

      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String url, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      if (this._token != null) {
        if (options != null) {
          options.headers["Authorization"] = "Bearer $_token";
        } else
          options = Options(
              headers: {"Authorization": "Bearer $_token"},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              });
      }
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }
}
