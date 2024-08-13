import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_connection_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class InternetConnectionEvent with _$InternetConnectionEvent {
  const factory InternetConnectionEvent.registerListenerForDeviceConnectivity() = RegisterListenerForDeviceConnectivity;
  const factory InternetConnectionEvent.checkInternetConnection() = CheckInternetConnection;
}
