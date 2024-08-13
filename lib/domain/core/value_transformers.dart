import 'dart:ui';

/// Remove any transparent in the input `Color`.
///
/// return `Color`.
///
/// ```dart
///  final tureBlackColor = makeColorOpaque(0x1f000000);
///  print(tureBlackColor); // Color(0xFF000000);
///```
Color makeColorOpaque(Color color) {
  return color.withAlpha(255);
}
