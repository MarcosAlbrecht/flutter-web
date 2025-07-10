// Ensure Bind is imported
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';
import 'modules/payment_type/payment_type_module.dart';
import 'modules/template/base_layout.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  //@override
  //List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module('/login', module: LoginModule());
    r.child(
      '/',
      child: (context) => const BaseLayout(body: RouterOutlet()),
      children: [
        //ChildRoute('/home', child: (context) => HomePage())
        ModuleRoute('/payment-type', module: PaymentTypeModule()),
      ],
    );
  }
}
