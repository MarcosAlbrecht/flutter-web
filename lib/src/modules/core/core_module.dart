import 'package:flutter_modular/flutter_modular.dart';

import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';
import '../../rest_client/custom_dio.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Storage>(SessionStorage.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
  }
}
