import 'package:json_annotation/json_annotation.dart';

import 'answer.dart';

part 'question.g.dart';

enum QuestionType { MAT, FUN, TEC }

String questionTypeName(QuestionType type) {
  switch (type) {
    case QuestionType.MAT:
      return 'Matemática';
    case QuestionType.FUN:
      return 'Fundamentos da Computação';
    case QuestionType.TEC:
      return 'Tecnologias da Computação';
    default:
      return null;
  }
}

@JsonSerializable()
class Question {
  static final table = "question";

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'question_description')
  String description;

  @JsonKey(name: 'test_id')
  int testId;

  @JsonKey(name: 'answers')
  List<Answer> answers;

  @JsonKey(name: 'type')
  QuestionType type;

  String get typeString {
    switch (type) {
      case QuestionType.MAT:
        return 'Matemática';
      case QuestionType.FUN:
        return 'Fundamentos da Computação';
      case QuestionType.TEC:
        return 'Tecnologias da Computação';
    }
    return '';
  }

  @JsonKey(name: 'completed', defaultValue: false)
  bool completed;

  @JsonKey(name: 'right', defaultValue: false)
  bool right;

  Question(this.id, this.number, this.description, this.answers, this.testId,
      this.type);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
