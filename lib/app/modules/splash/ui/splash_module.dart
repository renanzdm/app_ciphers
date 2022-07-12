import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_cipher_app/app/core/services/user_service/user_preferences_service.dart';

import './splash_controller.dart';
import './splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController(userServicePreferences: i.get<UserPreferencesService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage(controller: Modular.get())),
  ];
}
