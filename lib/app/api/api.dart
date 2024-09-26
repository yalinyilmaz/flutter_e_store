import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_e_store/app/api/config/api_config.dart';
import 'package:flutter_e_store/app/api/config/api_config_preprod.dart';
import 'package:flutter_e_store/app/api/interceptors/new_error_handler_interceptor.dart';
import 'package:flutter_e_store/feature/auth/repo/user_auth_client.dart';
import 'package:flutter_e_store/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supercharged/supercharged.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref, ApiConfigPreProd());
});

ApiClient get api => container.read(apiClientProvider);

class ApiClient {
  ApiClient(this.ref,this.config);

  final Ref ref;
  final ApiConfig config;

 late final UserAuthClient firbaseAuth = UserAuthClient();


  
  Dio? _dio;

  Dio get dio {
    _dio ??= Dio()
      ..options.contentType = 'application/json'
      ..options.connectTimeout = 120.seconds
      ..options.receiveTimeout = 120.seconds
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