import 'package:flutter/material.dart';

class BaseRaisedButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final double radius;
  final List<Color> colors;
  final Function onPressed;
  final EdgeInsets margin;

  const BaseRaisedButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.colors,
    this.onPressed,
    this.radius,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: this.onPressed != null ? 1.0 : 0.5,
      child: Container(
        width: width,
        height: 50.0,
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            gradient: gradient ?? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: this.colors,
            ),
            borderRadius: BorderRadius.circular(radius ?? 8)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(radius ?? 8),
              onTap: onPressed,
              child: Center(
                child: child,
              )),
        ),
      ),
    );
  }
}
