// Ensure Bind is imported
import 'package:flutter_modular/flutter_modular.dart';

import './modules/home/home_page.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}
  // @override
  // List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module('/login', module: LoginModule());
    r.child('/home', child: (context) => const HomePage());
  }
}
