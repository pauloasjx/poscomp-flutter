import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BaseLoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool visible;
  final showLoading;

  BaseLoadingOverlay({this.child, this.visible, this.showLoading = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Visibility(
          visible: visible,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.33)),
              child: Center(
                child: Visibility(
                  visible: showLoading,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 100.0,
                      maxWidth: 100.0
                    ),
                    child: SpinKitRing(
                      lineWidth: 3.0,
                      color: Colors.grey[900],
                      size: 50.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
