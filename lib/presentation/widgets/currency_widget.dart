import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_crypto/domain/cubits/crypto_cubit.dart';
import 'package:polygon_crypto/domain/models/ticker_model.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({
    Key? key,
    required this.ticker,
  }) : super(key: key);

  final TickerModel ticker;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoCubit, CryptoState>(
      bloc: context.read<CryptoCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${ticker.name}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${ticker.price}'),
                      const SizedBox(width: 70),
                      Text(
                          '${((ticker.high! - ticker.price!) / ticker.high!) * 100}'),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}
