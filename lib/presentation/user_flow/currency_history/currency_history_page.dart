import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/shimmer_loading.dart';
import 'package:currency_converter/presentation/user_flow/currency_history/components/body.dart';
import 'package:flutter/material.dart';

/// This Page and it's Components will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@RoutePage()
class CurrencyHistoryPage extends StatelessWidget {
  const CurrencyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: shimmerGradient,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Currencies History', style: context.font16w700),
          centerTitle: true,
        ),
        body: const Body(),
      ),
    );
  }
}
