import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.themeChanged() = ThemeChanged;
  const factory ThemeEvent.initializeThemeData() = InitializeThemeData;
}
