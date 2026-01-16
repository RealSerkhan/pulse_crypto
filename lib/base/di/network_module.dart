import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto_assessment/base/networking/dio_http_client.dart';
import 'package:crypto_assessment/base/networking/http_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true));

    return dio;
  }

  @lazySingleton
  HttpClient httpClient(Dio dio) => DioHttpClient(dio);
}
