import 'package:flutter_modular/flutter_modular.dart';

import './splash_controller.dart';
import './splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage(controller: Modular.get())),
  ];
}
