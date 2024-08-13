import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'internet_connection_event.dart';
import 'internet_connection_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@Singleton()
class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final Connectivity _connectivity;
  final InternetConnection _internetConnection;
  bool forTheFirstTime = true;
  InternetConnectionBloc(this._connectivity, this._internetConnection) : super(const InternetConnectionState.initial()) {
    on<RegisterListenerForDeviceConnectivity>(_onRegisterListenerForDeviceConnectivity, transformer: restartable());
    on<CheckInternetConnection>(_onCheckInternetConnection, transformer: restartable());
  }

  _onRegisterListenerForDeviceConnectivity(RegisterListenerForDeviceConnectivity event, Emitter<InternetConnectionState> emit) async {
    await emit.forEach(
      _connectivity.onConnectivityChanged,
      onData: (_) {
        add(const InternetConnectionEvent.checkInternetConnection());
        return state;
      },
      onError: (e, s) {
        return const InternetConnectionState.noInternetConnection();
      },
    );
  }

  _onCheckInternetConnection(CheckInternetConnection event, Emitter<InternetConnectionState> emit) async {
    if (forTheFirstTime) {
      forTheFirstTime = false;
      return;
    }
    state.map(
      initial: (_) {
        return;
      },
      noInternetConnection: (_) {},
      internetConnectionIsBack: (_) {},
    );

    final hasInternetConnection = await _internetConnection.hasInternetAccess;
    hasInternetConnection
        ? emit(const InternetConnectionState.internetConnectionIsBack())
        : emit(const InternetConnectionState.noInternetConnection());
  }
}
