import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_crypto/presentation/widgets/rich_text.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key,
    this.high,
    this.low,
    this.open,
    this.close,
  }) : super(key: key);
  final double? high;
  final double? low;
  final double? open;
  final double? close;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichTextWidget(
                text: 'HIGH: ',
                number: '$high',
              ),
              RichTextWidget(
                text: 'OPEN: ',
                number: '$open',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichTextWidget(
                text: 'LOW: ',
                number: '$low',
              ),
              RichTextWidget(
                text: 'CLOSE: ',
                number: '$close',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
