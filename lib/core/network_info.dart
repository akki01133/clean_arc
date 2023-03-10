import 'package:nb_utils/nb_utils.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  @override
  Future<bool> get isConnected => Future.any([isConnectedToMobile(), isConnectedToWiFi()]);
}
