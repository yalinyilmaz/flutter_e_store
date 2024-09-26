import 'dart:developer';
import 'package:dio/dio.dart';

class ErrorHandlerInterceptor implements Interceptor {
  bool _passRequest = false;
  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    String message = '';


    log("************** interceptor on error built ***********************");

    if (_passRequest) {
      return handler.reject(err);
    }
  }
  

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
      handler.next(response);
  }
}
