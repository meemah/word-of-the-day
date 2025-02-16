import 'package:dio/dio.dart';

abstract class IApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params});
}

class ApiService extends IApiService {
  final Dio _dio;

  ApiService({Dio? dio, required String baseUrl})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: "https://urban-dictionary7.p.rapidapi.com/v0",
              headers: {
                "x-rapidapi-key":
                    "6b69702c3emshe7e9db4897a9311p1ea77cjsn302812f8b301",
                "x-rapidapi-host": "urban-dictionary7.p.rapidapi.com"
              },
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

  @override
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";
      case DioExceptionType.badResponse:
        return error.response?.data["message"] ?? "Failed to load data.";

      default:
        return "An unexpected error occurred.";
    }
  }
}
