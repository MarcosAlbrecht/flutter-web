import 'package:flutter_modular/flutter_modular.dart';

import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../rest_client/custom_dio.dart';

class CoreModule extends Module {
  // @override
  // void binds(i) {
  //   i.addLazySingleton<Storage>(SessionStorage.new);
  //   i.addLazySingleton<CustomDio>(CustomDio.new);
  //   i.addLazySingleton<PaymentTypeRepository>(PaymentTypeRepositoryImpl.new);
  // }

  @override
  void exportedBinds(i) {
    i.addSingleton<Storage>(SessionStorage.new);
    i.addSingleton<CustomDio>(CustomDio.new);
    i.addSingleton<PaymentTypeRepository>(PaymentTypeRepositoryImpl.new);
  }
}
