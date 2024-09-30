import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';

class ErrorHandlerInterceptor implements Interceptor {
  bool _passRequest = false;
  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) async {

    log("************** interceptor on error built ***********************");
    MessageDialog.singleButton(
        purpose: MessageDialogPurpose.warning,
        caption: "Hata",
        content: "Sunucudan yanıt alınamadı");

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
