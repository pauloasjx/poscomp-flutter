import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poscomp/models/question.dart';
import 'package:poscomp/modules/filter/filter_screen.dart';
import 'package:poscomp/modules/question/question_bloc.dart';
import 'package:poscomp/modules/question/question_event.dart';
import 'package:poscomp/modules/question/question_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:poscomp/widgets/base_back_button.dart';
import 'package:poscomp/widgets/base_raised_button.dart';
import 'package:poscomp/widgets/base_raised_button_title.dart';
import 'package:poscomp/modules/question/widgets/sliding_panel_widget.dart';
import 'package:flutter_tex/flutter_tex.dart';

import 'bloc.dart';

class QuestionScreen extends StatefulWidget {
  final FilterType filterType;

  QuestionScreen({this.filterType});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionBloc _questionBloc;
  PanelController _panelController;
  ScrollController _scrollController;

  @override
  void initState() {
    _questionBloc = QuestionBloc();
    _questionBloc.dispatch(TrainQuestionsFetch());
    _panelController = PanelController();
    _scrollController = ScrollController();

    super.initState();
  }

  Widget _buildItem(BuildContext context, int index, Question question) {
    bool isSelected = question.answers[index].isSelected;
    bool isCorrect = question.answers[index].correct;

    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: !question.completed
            ? () => {
                  _questionBloc
                      .dispatch(SelectAnswer(answer: question.answers[index]))
                }
            : null,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                  width: 40.0,
                  height: 40.0,
                  child: Center(
                      child: Text(question.answers[index].marker,
                          style: TextStyle(
                              color: question.completed && isCorrect
                                  ? Colors.green[400]
                                  : isSelected
                                      ? Colors.white
                                      : filterTypeColor(widget.filterType, 900),
                              fontWeight: FontWeight.bold))),
                  decoration: BoxDecoration(
                      color: isSelected
                          ? filterTypeColor(widget.filterType, 900)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: question.completed && isCorrect ? 8.0 : 1.0,
                          color: question.completed && isCorrect
                              ? Colors.green[400]
                              : isSelected
                                  ? Colors.transparent
                                  : filterTypeColor(widget.filterType, 900)))),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16.0, right: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: TeXView(
                            teXHTML: question.answers[index].description),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _questionBloc,
        builder: (BuildContext context, QuestionState state) {
          return Stack(
            children: <Widget>[
              SlidingPanelWidget(
                state: state,
                controller: _panelController,
                bloc: _questionBloc,
                body: SafeArea(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BaseBackButton(),
                          Container(
                            margin: EdgeInsets.only(top: 32.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                      state.currentIndex + 1 >= 10
                                          ? "${state.currentIndex + 1})"
                                          : "0${state.currentIndex + 1})",
                                      style: TextStyle(
                                          color: filterTypeColor(
                                              widget.filterType, 900),
                                          fontSize: 36.0)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Poscomp 2019',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(state.currentQuestion.typeString ??
                                          ""),
                                      Text(
                                          "Questão ${state.currentQuestion.number < 10 ? "0" : ""}${state.currentQuestion.number.toString()}"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: TeXView(
                                teXHTML: state.currentQuestion.description),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.currentQuestion.answers.length,
                              itemBuilder: (context, index) => _buildItem(
                                  context, index, state.currentQuestion)),
                          BaseRaisedButton(
                            colors: [
                              filterTypeColor(widget.filterType, 800),
                              filterTypeColor(widget.filterType, 900)
                            ],
                            margin: EdgeInsets.only(top: 16.0, bottom: 64.0),
                            child: BaseRaisedButtonTitle('Enviar'),
                            onPressed: !state.currentQuestion.completed
                                ? () => {
                                      _questionBloc.dispatch(ConfirmAnswer()),
                                    }
                                : null,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
