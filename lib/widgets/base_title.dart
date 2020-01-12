import 'package:flutter/material.dart';

class BaseTitle extends StatelessWidget {
  final String title;
  final EdgeInsets margin;
  final double fontSize;
  final Color color;

  BaseTitle(this.title, {this.color, this.margin, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 32.0),
      child: Text(title,
          style: TextStyle(
              color: this.color ?? Colors.black,
              fontSize: this.fontSize ?? 36.0)),
    );
  }
}
