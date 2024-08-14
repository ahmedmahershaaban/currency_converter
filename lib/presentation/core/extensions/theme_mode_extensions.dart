import 'package:currency_converter/application/shared/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Extension on [BuildContext] to help using it and make a lot of shortcuts that would
/// maintain clean and reusable code.
extension DarkMode on BuildContext {
  /// Check dark mode
  bool get isDarkMode {
    return read<ThemeBloc>().state.isDarkMode;
  }
}
