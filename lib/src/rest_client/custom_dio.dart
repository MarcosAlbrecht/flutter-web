import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../core/env/env.dart';

class CustomDio extends DioForBrowser {
  CustomDio()
    : super(
        BaseOptions(
          baseUrl: Env.instance.get('backend_base_url'),
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 60),
        ),
      ) {
    interceptors.add(LogInterceptor(request: true, requestBody: true, requestHeader: true, responseHeader: true));
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unauth() {
    return this;
  }
}
