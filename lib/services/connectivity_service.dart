import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final connectionStatusController = StreamController<ConnectivityResult>();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((event) {
      // Закидываем событие в поток (поле класса)
      connectionStatusController.add(event);
    });
  }

  Future<ConnectivityResult> getCurrentStatus() async {
    return await _connectivity.checkConnectivity();
  }
}
