import 'package:flutter/material.dart';
import 'package:the_cipher_app/app/core/services/remote_config/custom_remote_config.dart';
import 'package:the_cipher_app/app/core/utils/init_state_complete.dart';

import './splash_controller.dart';

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

class _SplashPageState extends State<SplashPage> with InitStateComplete {
  final remoteConfig = CustomRemoteConfig();

  @override
  void completeInitState() async {
    await remoteConfig.setConfigRemote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Container(),
    );
  }
}
