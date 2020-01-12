import 'package:flutter/material.dart';
import 'package:poscomp/modules/question/bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:poscomp/misc/custom_icons.dart';

import '../question_state.dart';

class SlidingPanelWidget extends StatelessWidget {
  final Widget body;
  final PanelController controller;
  final QuestionState state;
  final QuestionBloc bloc;

  SlidingPanelWidget({this.body, this.controller, this.state, this.bloc});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: controller,
      maxHeight: 100.0,
      minHeight: state.currentQuestion.completed ? 100 : 0.0,
      panel: Container(
        decoration: BoxDecoration(
            color:
                Color(state.currentQuestion.right ? 0xFFEDFFED : 0xFFFFF0ED)),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 32.0),
                child: Icon(
                    state.currentQuestion.right
                        ? CustomIcons.check
                        : CustomIcons.delete,
                    size: 32.0,
                    color: Color(
                        state.currentQuestion.right ? 0xFF55CC55 : 0xFFFA3838)),
              ),
              Container(
                margin: EdgeInsets.only(left: 32.0),
                child: Text(
                    state.currentQuestion.right
                        ? 'Correta'.toUpperCase()
                        : 'Errada'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Color(state.currentQuestion.right
                            ? 0xFF55CC55
                            : 0xFFFA3838))),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(64.0),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      icon: Icon(Icons.navigate_next,
                          color: Color(state.currentQuestion.right
                              ? 0xFF55CC55
                              : 0xFFFA3838)),
                      onPressed: () => {
                            bloc.dispatch(
                                ChangeQuestion(state.currentIndex + 1))
                          }),
                ),
              )
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
