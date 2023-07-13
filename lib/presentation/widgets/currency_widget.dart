import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_crypto/domain/models/ticker/ticker_model.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({
    Key? key,
    required this.ticker,
    this.onPressed,
  }) : super(key: key);

  final TickerModel ticker;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${ticker.name}',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${ticker.price}',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 50),
                    SizedBox(
                      width: 70,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          '+${(((ticker.high! - ticker.price!) / ticker.high!) * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        subtitle: Text(
                            '+${(((ticker.high! - ticker.price!) / ticker.high!)).toStringAsFixed(2)}'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
