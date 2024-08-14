import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_converter/domain/shared/connectivity_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectivityRepository)
class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;

  ConnectivityRepositoryImpl(this._connectivity);
  @override
  Stream<List<ConnectivityDeviceResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged.map((List<ConnectivityResult> event) {
        return event.map((ConnectivityResult e) {
          switch (e) {
            case ConnectivityResult.none:
              return ConnectivityDeviceResult.none;
            case ConnectivityResult.wifi:
              return ConnectivityDeviceResult.wifi;
            case ConnectivityResult.mobile:
              return ConnectivityDeviceResult.mobile;
            case ConnectivityResult.ethernet:
              return ConnectivityDeviceResult.ethernet;
            case ConnectivityResult.bluetooth:
              return ConnectivityDeviceResult.bluetooth;
            case ConnectivityResult.other:
              return ConnectivityDeviceResult.other;
            default:
              return ConnectivityDeviceResult.other;
          }
        }).toList();
      });
}
