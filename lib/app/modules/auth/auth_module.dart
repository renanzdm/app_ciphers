import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:the_cipher_app/app/modules/auth/auth_repositories/auth_repositories.dart';
import 'package:the_cipher_app/app/modules/auth/register/register_controller.dart';
import 'package:the_cipher_app/app/modules/auth/register/register_page.dart';

import '../../core/services/graphql_client/custom_graphql_client.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthRepositorie>((i) => AuthRepositorieImpl(graphqlClient: i.get<CustomGraphqlClient>())),
    BlocBind.lazySingleton((i) => RegisterController(authRepositorie: i.get<AuthRepositorie>())),
    BlocBind.lazySingleton<LoginController>((i) => LoginController(authRepositorie: i.get<AuthRepositorie>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage(controller: Modular.get())),
    ChildRoute('/register', child: (_, args) => RegisterPage(registerController: Modular.get())),
  ];
}
