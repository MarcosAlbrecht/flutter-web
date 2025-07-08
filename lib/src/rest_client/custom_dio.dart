import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../core/env/env.dart';
import '../core/storage/storage.dart';
import 'interceptors/auth_interceptor.dart';

class CustomDio extends DioForBrowser {
  late AuthInterceptor _authInterceptor;

  CustomDio(Storage storage)
    : super(
        BaseOptions(
          baseUrl: Env.instance.get('backend_base_url'),
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 60),
        ),
      ) {
    interceptors.add(LogInterceptor(request: true, requestBody: true, requestHeader: true, responseHeader: true));
    _authInterceptor = AuthInterceptor(storage);
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
