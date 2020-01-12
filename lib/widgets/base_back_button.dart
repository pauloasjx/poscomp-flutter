import 'package:flutter/material.dart';
import 'package:poscomp/misc/custom_icons.dart';

class BaseBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16.0),
        child: IconButton(
            icon: Icon(CustomIcons.back, color: Colors.grey, size: 16.0),
            onPressed: () => {Navigator.pop(context, true)}));
  }
}
