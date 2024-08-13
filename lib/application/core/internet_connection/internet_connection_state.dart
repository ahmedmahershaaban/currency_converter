import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_connection_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class InternetConnectionState with _$InternetConnectionState {
  const factory InternetConnectionState.initial() = Inital;
  const factory InternetConnectionState.noInternetConnection() = NoInternetConnection;
  const factory InternetConnectionState.internetConnectionIsBack() = internetConnectionIsBack;
}
