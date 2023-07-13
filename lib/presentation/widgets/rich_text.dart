import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
    this.text,
    this.number,
  }) : super(key: key);

  final String? text;
  final String? number;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$number',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
