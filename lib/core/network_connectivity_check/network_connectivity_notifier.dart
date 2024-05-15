import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisconnected, bluetooth,ethernet, vpn, other }

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {

  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisconnected;
    }
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = ConnectivityStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectivityStatus.isDisconnected;
          break;
        case ConnectivityResult.bluetooth:
          newState = ConnectivityStatus.bluetooth;
          break;
        case ConnectivityResult.ethernet:
          newState = ConnectivityStatus.ethernet;
          break;
        case ConnectivityResult.vpn:
          newState = ConnectivityStatus.vpn;
          break;
        case ConnectivityResult.other:
          newState = ConnectivityStatus.other;
          break;
      }
      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}