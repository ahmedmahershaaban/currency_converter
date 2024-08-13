import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_failure.freezed.dart';

/// These are the [UserFlowFailure] which will be returned from [IUserFlowFacade] instead of [Error].
///
/// This will ensure the safety of the application with out getting any un needed [Error]s
/// instead we have it now in a format that could be handled and passed with in the app safely.
@freezed
abstract class UserFlowFailure with _$UserFlowFailure {
  /// This [UserFlowFailure] will occur when there is unexpected error happened and not handled in the
  /// logic of the implementation to be returned as [UserFlowFailure] this it will be [UserFlowFailure.serverError].
  const factory UserFlowFailure.serverError() = ServerError;

  /// This [UserFlowFailure] will occur when there is no internet connection while doing a request to the API.
  const factory UserFlowFailure.noInternetConnection() = NoInternetConnection;

  /// This [UserFlowFailure] will occur when the user is trying to make a request that over his permissions.
  const factory UserFlowFailure.insufficientPermission() = InsufficientPermission;

  /// This [UserFlowFailure] will occur when the user try to access a feature that is not implemented yet.
  const factory UserFlowFailure.notImplementedFeature() = NotImplementedFeature;

  /// This [UserFlowFailure] will occur when the user try make a request to api that has experienced or invalid API key.
  const factory UserFlowFailure.invalidApiKey() = InvalidApiKey;

  /// This [UserFlowFailure] will occur when the user try make a request with invalid date type format that the API expect .
  const factory UserFlowFailure.invalidDateInputFormat() = InvalidDateInputFormat;
}

/// Mapping each [UserFlowFailure] to a `String`.
///
/// This helps when you are getting [UserFlowFailure] and want to display an error message on
/// the screen for the user, you only call [getUserFlowFailureString] instead of manually mapping
/// all [UserFlowFailure] to a string, also this makes the error handling maintainable and any change
/// in this function will effect all the [UserFlowFailure] error messaging.
///
/// ```dart
/// // will assign any UserFlowFailure like if we get it from API call from the infrastructure layer.
/// final userFlowFailure = UserFlowFailure.serverError();
/// IconSnackBar.show(
/// context: context,
/// snackBarType: SnackBarType.fail,
/// label: getUserFlowFailureString(userFlowFailure),
/// ); // will show pop up on screen with the right error message.
/// ```
String getUserFlowFailureString(UserFlowFailure value) {
  return value.map(
    serverError: (_) => 'Server Error!',
    noInternetConnection: (_) => 'No Internet Connection!',
    insufficientPermission: (_) => "You don't have enough permission!",
    notImplementedFeature: (_) => 'We are developing this feature, wait for the next update!',
    invalidApiKey: (_) => 'Please contact support!',
    invalidDateInputFormat: (_) => 'Please contact support!',
  );
}
