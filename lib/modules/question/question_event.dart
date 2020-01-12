import 'package:poscomp/models/answer.dart';

abstract class QuestionEvent {}

class SelectAnswer extends QuestionEvent {
  final Answer answer;

  SelectAnswer({this.answer});
}

class TrainQuestionsFetch extends QuestionEvent {}

class ConfirmAnswer extends QuestionEvent {}

class ChangeQuestion extends QuestionEvent {
  int index;

  ChangeQuestion(this.index);
}

class SaveSession extends QuestionEvent {}
