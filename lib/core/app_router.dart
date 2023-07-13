import 'package:flutter/material.dart';
import 'package:polygon_crypto/presentation/screens/currency_detail_screen.dart';

class AppRouter {
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    return;
  }

  static void toCurrencyDetail(
    String? tickerName,
    double? tickerPrice,
    BuildContext context,
  ) {
    final route = MaterialPageRoute(
        builder: (_) => CurrencyDetailScreen(
              tickerName: tickerName ?? ' ',
              tickerPrice: tickerPrice,
            ));
    Navigator.of(context).push(route);
  }
}
