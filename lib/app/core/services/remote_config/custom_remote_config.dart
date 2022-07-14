import 'package:firebase_remote_config/firebase_remote_config.dart';

class CustomRemoteConfig {
  final _remoteConfig = FirebaseRemoteConfig.instance;
  Future<void> setConfigRemote() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  Future<String> fetchString({required String key}) async {
    return _remoteConfig.getString(key);
  }
}
