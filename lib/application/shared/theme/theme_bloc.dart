import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:currency_converter/application/shared/theme/theme_event.dart';
import 'package:currency_converter/application/shared/theme/theme_state.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/domain/shared/shared_preferences_repository.dart';
import 'package:currency_converter/infrastructure/core/injection/injection.dart';
import 'package:currency_converter/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

const String themePreferenceKey = 'THEME_DATA';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@LazySingleton()
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferencesRepository _prefs;
  ThemeBloc(this._prefs) : super(ThemeState.initial()) {
    on<ThemeChanged>(_onThemeChanged, transformer: restartable());
    on<InitializeThemeData>(_onInitializeThemeData, transformer: restartable());

    add(const ThemeEvent.initializeThemeData());
  }

  _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    if (state.isDarkMode) {
      await _prefs.setString(themePreferenceKey, 'isLightMode');
      emit(ThemeState(
        themeData: appThemeData[AppTheme.light]!,
        isDarkMode: false,
      ));
    } else {
      await _prefs.setString(themePreferenceKey, 'isDarkMode');
      emit(ThemeState(
        themeData: appThemeData[AppTheme.dark]!,
        isDarkMode: true,
      ));
    }

    try {
      if (getIt.isRegistered<UserFlowBloc>()) {
        getIt<UserFlowBloc>().add(const UserFlowEvent.themeModeChangedEvent());
      }
    } catch (e) {
      debugPrint('Error in [ThemeBloc] for [_onThemeChanged] : $e');
    }
  }

  /// Will start the app with the Light mode ..
  /// remove the comments to get the device mode !
  _onInitializeThemeData(InitializeThemeData event, Emitter<ThemeState> emit) async {
    final String? isDarkMode = _prefs.getString(themePreferenceKey);
    if (isDarkMode != null) {
      if (isDarkMode == 'isDarkMode') {
        emit(ThemeState(
          themeData: appThemeData[AppTheme.dark]!,
          isDarkMode: true,
        ));
      }
    } else {
      final brightness = MediaQueryData.fromView(WidgetsBinding.instance.window).platformBrightness;
      if (brightness == Brightness.dark) {
        emit(ThemeState(
          themeData: appThemeData[AppTheme.dark]!,
          isDarkMode: true,
        ));
      } else {
        emit(ThemeState(
          themeData: appThemeData[AppTheme.light]!,
          isDarkMode: false,
        ));
      }
    }
  }
}
