import 'package:connectivity/connectivity.dart';

class CheckConnection {
  static void check({ onConnected, onDisconnected }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      onConnected();
    } else {
      onDisconnected();
    }
  }
}