import 'package:flutter/material.dart';
import 'package:poscomp/static/home_static.dart';

class HomeMenuWidget extends StatelessWidget {
  final int index;

  HomeMenuWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => menus[index]['route'])),
        child: Ink(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Icon(menus[index]['icon'], color: Colors.white, size: constraint.biggest.height/4);
            }
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  menus[index]['startColor'],
                  menus[index]['endColor'],
                ],
              )),
        ),
      ),
    );
  }
}
