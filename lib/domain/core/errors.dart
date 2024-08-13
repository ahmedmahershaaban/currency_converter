import 'package:currency_converter/domain/core/failures.dart';

/// This [Error] type will be thrown if the user is not authenticated.
///
///```dart
/// final userId = _auth.getUserId();
/// // This will throw the error if the user is not authenticated!
/// ```
class NotAuthenticatedError extends Error {}

/// This [Error] type will be thrown most of the time when calling [Options.getOrElse]
/// to get the data of `Option` type and got `none` instead of `some`.
class UnexpectedNullValueError extends Error {}

/// This [Error] type will be thrown if [ValueObject.getOrCrash] is called
/// or any other functions doing the same thing like [ValidatedInt.toInt] or [ValidatedDouble.toDouble].
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
