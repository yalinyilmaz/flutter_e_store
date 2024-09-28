import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_e_store/app/api/config/api_config.dart';
import 'package:flutter_e_store/app/api/config/api_config_preprod.dart';
import 'package:flutter_e_store/app/api/interceptors/new_error_handler_interceptor.dart';
import 'package:flutter_e_store/feature/auth/repo/product_client.dart';
import 'package:flutter_e_store/feature/auth/repo/user_auth_client.dart';
import 'package:flutter_e_store/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supercharged/supercharged.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref, ApiConfigPreProd());
});

ApiClient get api => container.read(apiClientProvider);

class ApiClient {
  ApiClient(this.ref, this.config);

  final Ref ref;
  final ApiConfig config;

  late final UserAuthClient firbaseAuth = UserAuthClient();

  late final ProductClient product =
      ProductClient(dio, baseUrl: config.baseApiUrl);

  Dio? _dio;

  Dio get dio {
    _dio ??= Dio()
      ..options.contentType = 'application/json'
      ..options.connectTimeout = 120.seconds
      ..options.receiveTimeout = 120.seconds
      ..options.headers = {
        'Authorization': 'Bearer AX5FTZ7UBAABUDT6XYYPW7LX',
        // 'Auth-URL': 'https://testcase.myideasoft.ide/panel/auth',
        // 'Access-Token-URL': 'https://testcase.myideasoft.ide/oauth/v2/token',
        // 'Client-ID': '7_7d67dc7597f034d63775c1d9ae5d9ac7f5750197f',
        // 'Client-Secret': '1sowg0oogc4wg4w4o4gh4va57gggwskkgo08m44ksog8kmu88o',
        // 'Scope': 'catalog_read',
        // 'State': '2b33fdd45jbevd6nam',
      }
      ..interceptors.addAll([
        ErrorHandlerInterceptor(),
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          request: true,
          error: true,
          logPrint: (object) => log(object.toString()),
        ),
      ]);
    return _dio!;
  }
}
