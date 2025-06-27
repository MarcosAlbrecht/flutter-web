import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    //i.addLazySingleton<PessoaRepository>(() => PessoaRepositoryImpl());
    //i.addLazySingleton<BuscarPessoaService>((i) => BuscarPessoaService(pessoaRepository: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
