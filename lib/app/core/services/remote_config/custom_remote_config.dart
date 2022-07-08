import 'package:firebase_remote_config/firebase_remote_config.dart';

class CustomRemoteConfig {
  final remoteConfig = FirebaseRemoteConfig.instance;
  Future<void> setConfigRemote() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
  }

  Future<RemoteConfigValue> fetchValue({required String key}) async {
    return remoteConfig.getValue(key);
  }
}
