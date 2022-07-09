import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_cipher_app/app/modules/auth/register/register_controller.dart';
import 'package:the_cipher_app/app/modules/auth/register/register_page.dart';

import 'login/login_controller.dart';
import 'login/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => RegisterController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage(controller: Modular.get())),
    ChildRoute('/register', child: (_, args) => RegisterPage(controller: Modular.get())),
  ];
}
