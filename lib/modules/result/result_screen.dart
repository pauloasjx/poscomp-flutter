import 'package:flutter/material.dart';
import 'package:poscomp/static/test_static.dart';
import 'package:poscomp/widgets/base_back_button.dart';
import 'package:poscomp/widgets/base_title.dart';
import 'package:poscomp/static/test_static.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseBackButton(),
                    BaseTitle('Provas Anteriores', color: Colors.orange[900]),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text(
                          'Veja os arquivos originais de provas anteriores.'),
                    ),
                    SizedBox(height: 32.0),
                    Text('Anos'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: tests.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(tests.reversed
                                          .toList()[index]['year']
                                          .toString()),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: (tests.reversed
                                            .toList()[index]['pdfs'] as List)
                                            .map((pdf) => IconButton(onPressed: () => {},icon: Icon(Icons.filter)))
                                            .toList(),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
