import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:the_cipher_app/app/core/services/graphql_client/custom_graphql_client.dart';
import 'package:the_cipher_app/app/core/services/graphql_client/custom_graphql_client_impl.dart';
import 'package:the_cipher_app/app/core/services/remote_config/custom_remote_config.dart';

import './app_controller.dart';
import '../splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<CustomGraphqlClient>(
      (i) => CustomGraphqlClientImpl(
        customRemoteConfig: CustomRemoteConfig(),
      ),
    ),
    BlocBind.lazySingleton((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: SplashModule(),
    ),
  ];
}
