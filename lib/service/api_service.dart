import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wotd/generated/l10n.dart';

abstract class IApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params});
}

class ApiService extends IApiService {
  final Dio _dio;

  ApiService({
    Dio? dio,
  }) : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: "https://urban-dictionary7.p.rapidapi.com/v0",
              headers: {
                "x-rapidapi-key": dotenv.get('RAPID_API_KEY'),
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
        return S.current.connectionTimeout;
      case DioExceptionType.receiveTimeout:
        return S.current.serverTookTooLongToRespond;
      case DioExceptionType.badResponse:
        return error.response?.data["message"] ?? S.current.failedToLoadData;

      default:
        return S.current.anUnexpectedErrorOccurred;
    }
  }
}
