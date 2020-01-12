import 'package:flutter/material.dart';

class BaseOutlineButtonTitle extends StatelessWidget {
  final String text;

  BaseOutlineButtonTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(),
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey[900]));
  }
}
