import 'package:flutter_modular/flutter_modular.dart';

import 'payment_type_page.dart';

class PaymentTypeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => PaymentTypePage());
  }
}
