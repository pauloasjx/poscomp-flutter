import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poscomp/repositories/question_repository.dart';
import './bloc.dart';
import 'bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  @override
  QuestionState get initialState => QuestionState.empty();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    print(event);

    if (event is TrainQuestionsFetch) {
      yield currentState.copyWith(isLoading: true);
      try {
        final questions = currentState.questions;

        for (var i=1; i<10; i++) {
          final question = await questionRepository.find(i);
          questions.add(question);
        }

        yield currentState.copyWith(questions: questions);
      } catch (e) {
        print(e.toString());
        yield currentState.copyWith(
            errorMessage: e.toString(), isLoading: false);
      }
    }

    if (event is ChangeQuestion) {
      print(event.index);

      yield currentState.copyWith(
          currentIndex: event.index, errorMessage: null);
    }

    if (event is SelectAnswer) {
      int index = currentState.currentQuestion.answers
          .indexWhere((answer) => answer.id == event.answer.id);

      QuestionState newState = currentState;

      if (true) {
        newState.currentQuestion.answers
            .forEach((answer) => answer.isSelected = false);
      }

      newState.currentQuestion.answers[index].isSelected =
          !newState.currentQuestion.answers[index].isSelected;

      yield currentState.copyWith(
          questions: newState.questions, errorMessage: null);
    }

    if (event is ConfirmAnswer) {
      QuestionState newState = currentState;

      final result = currentState.currentQuestion.answers
          .map((answer) => answer.isSelected == answer.correct);

      print(result);

      newState.currentQuestion
        ..completed = true
        ..right = !result.contains(false);

      yield currentState.copyWith(
          questions: newState.questions, errorMessage: null);
    }

    if (currentState.questions.isNotEmpty) {
      final isCompleted = !currentState.questions
          .map((question) => question.completed)
          .contains(false);

      if (isCompleted) {

        yield currentState.copyWith(
            isCompleted: true);
      }
    }
  }
}
