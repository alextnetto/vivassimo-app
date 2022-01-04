import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectionHandler {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionHandler _singleton = ConnectionHandler._internal();
  ConnectionHandler._internal();
  //This is what's used to retrieve the instance through the app
  static ConnectionHandler getInstance() => _singleton;
  //This tracks the current connection status
  bool hasConnection = false;
  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController();
  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    hasInternetInternetConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;
  Future<bool> hasInternetInternetConnection() async {
    bool previousConnection = hasConnection;
    var connectivityResult = await (Connectivity().checkConnectivity());
    //Check if device is just connect with mobile network or wifi
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      hasConnection = true;
    }
    // device has no mobile network and wifi connection at all
    else {
      hasConnection = false;
    }
    // The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }

  void dispose() {
    connectionChangeController.close();
  }
}
