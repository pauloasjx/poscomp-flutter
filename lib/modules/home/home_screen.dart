import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poscomp/static/home_static.dart';
import 'package:poscomp/widgets/base_layout.dart';
import 'package:poscomp/widgets/base_painter.dart';
import 'package:snaplist/snaplist_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BaseLayout(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16.0),
                Text('Poscomp'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold)),
                Text('Simulador'.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w100)),
              ],
            ),
          ),
          SizedBox(height: 64.0),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: SnapList(
              padding: EdgeInsets.only(left: width / 2 - 125),
              sizeProvider: (index, data) => Size(250, 250),
              separatorProvider: (index, data) => Size(10.0, height / 3),
              builder: (context, index, data) => ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          menus[index]['startColor'],
                          menus[index]['endColor'],
                        ],
                      )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(menus[index]['icon'],
                              color: Colors.white, size: 80.0),
                          SizedBox(height: 8.0),
                          Text(menus[index]['title'].toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 32.0),
                            child: Text(
                                menus[index]['description']
                                    .toString()
                                    .toLowerCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100)),
                          )
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => menus[index]['route']))
                        },
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              count: menus.length,
            ),
          ),
          SizedBox(height: 32.0),
          Container(
            margin: EdgeInsets.all(32.0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: '',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  children: [
                    TextSpan(
                        text: 'Poscomp'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' é um exame organizado anualmente pela Sociedade Brasileira de Computação com o objetivo de avaliar os conhecimentos em computação dos candidatos a vagas em programas de pós-graduação na área. As instituições que oferecem as vagas utilizam o resultado do exame de diversas formas em seus processos seletivos.'),
                    TextSpan(
                        text: '\n\nOrigem: Wikipédia, a enciclopédia livre.',
                        style: new TextStyle(fontWeight: FontWeight.w100)),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
