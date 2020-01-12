import 'package:flutter/material.dart';

class BaseRaisedButtonTitle extends StatelessWidget {
  final String text;

  BaseRaisedButtonTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
  }
}
