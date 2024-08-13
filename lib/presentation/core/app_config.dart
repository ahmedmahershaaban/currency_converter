import 'package:flutter/cupertino.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String iconAssets;

  @override
  final Widget child;

  AppConfig({
    Key? key,
    required this.appTitle,
    required this.buildFlavor,
    required this.iconAssets,
    required this.child,
  }) : super(key: key, child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
