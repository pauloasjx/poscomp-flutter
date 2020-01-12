import 'package:flutter/material.dart';
import 'package:poscomp/misc/custom_icons.dart';
import 'package:poscomp/modules/filter/filter_screen.dart';
import 'package:poscomp/widgets/base_back_button.dart';
import 'package:poscomp/widgets/base_outline_button.dart';
import 'package:poscomp/widgets/base_raised_button.dart';
import 'package:poscomp/widgets/base_title.dart';

class TrainScreen extends StatefulWidget {
  @override
  _TrainScreenState createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  Widget _buildEmptyFilter(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Center(
          child: Container(
            child: Stack(alignment: Alignment(0.5, 1.0), children: <Widget>[
              Container(
                child: Icon(CustomIcons.ptrain,
                    size: 128, color: Colors.green[900].withOpacity(0.3)),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(64.0),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FilterScreen(filterType: FilterType.TRAIN)))
                },
                child: Ink(
                  width: 40.0,
                  height: 40.0,
                  child: Icon(Icons.add, color: Colors.white, size: 18.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.green[800],
                          Colors.green[900],
                        ],
                      )),
                ),
              ),
            ]),
          ),
        )),
        Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 32.0),
          child: Center(
              child: Text('Nenhum filtro \nAdicionado'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]))),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseBackButton(),
                  BaseTitle('Treinar', color: Colors.green[900]),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                        'Treine em questões aleatórias com a possibilidade de escolha de filtros.'),
                  )
                ],
              ),
              _buildEmptyFilter(context),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 16.0, 4.0, 8.0),
                        child: BaseOutlineButton(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.green[800],
                              Colors.green[900],
                            ],
                          ),
                          radius: 6,
                          strokeWidth: 2,
                          child: Text('Voltar'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900])),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(4.0, 16.0, 0.0, 8.0),
                        child: BaseRaisedButton(
                          radius: 8,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.green[800], Colors.green[900]],
                          ),
                          child: Text('Iniciar Treino'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          onPressed: () => {},
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
