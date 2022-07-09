import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_cipher_app/app/core/services/remote_config/custom_remote_config.dart';
import 'package:the_cipher_app/app/core/utils/init_state_complete.dart';

import './splash_controller.dart';
import '../../../core/ui/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
    required SplashController controller,
  })  : _controller = controller,
        super(key: key);
  final SplashController _controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with InitStateComplete<SplashPage> {
  final remoteConfig = CustomRemoteConfig();
  @override
  void completeInitState() async {
    await remoteConfig.setConfigRemote();
    await widget._controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashController, SplashState>(
        bloc: widget._controller,
        listener: (context, state) async {
          if (state.loading) {
            LoadingWidget.showLoading(context);
          } else {
            LoadingWidget.hideLoading();
          }
          if (state.user.email.isNotEmpty) {
          } else {
            Modular.to.pushReplacementNamed('/auth/login');
          }
        },
        builder: (context, state) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFF0533F2),
            ),
            child: Center(
              child: Image.asset('assets/images/electric-guitar.png'),
            ),
          );
        },
      ),
    );
  }
}
