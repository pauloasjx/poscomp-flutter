import 'package:meta/meta.dart';
import 'package:poscomp/models/answer.dart';
import 'package:poscomp/models/question.dart';

@immutable
class QuestionState {
  final int currentIndex;
  final List<Question> questions;
  final String errorMessage;
  final bool isCompleted;
  final bool isLoading;
  final int renderCompleted;

  int get right {
    return questions
        .map((question) => !question.answers
                .map((answer) => answer.correct == answer.isSelected)
                .contains(false)
            ? 1
            : 0)
        .reduce((a, b) => a + b);
  }

  Question get currentQuestion => questions[currentIndex];

  factory QuestionState.empty() {
    return QuestionState(
        currentIndex: 0,
        questions: [],
        errorMessage: null,
        isCompleted: false,
        isLoading: false,
        renderCompleted: 0);
  }

  QuestionState(
      {this.currentIndex,
      this.questions,
      this.errorMessage,
      this.isCompleted,
      this.isLoading,
      this.renderCompleted});

  QuestionState copyWith(
      {int currentIndex,
      List<Answer> selectedAnswers,
      List<Question> questions,
      int totalExp,
      String errorMessage,
      bool isCompleted,
      bool isLoading,
      int renderCompleted}) {
    return QuestionState(
        currentIndex: currentIndex ?? this.currentIndex,
        questions: questions ?? this.questions,
        errorMessage: errorMessage,
        isCompleted: isCompleted ?? this.isCompleted,
        isLoading: isLoading ?? this.isLoading,
        renderCompleted: renderCompleted ?? this.renderCompleted);
  }
}
