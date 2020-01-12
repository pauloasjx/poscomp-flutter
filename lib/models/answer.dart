import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  static final table = "answer";

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'marker')
  String marker;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'correct')
  int _correct;

  bool get correct => _correct == 1;

  @JsonKey(name: 'isSelected', defaultValue: false)
  bool isSelected;

  @JsonKey(name: 'question_id')
  int questionId;

  Answer(this.id, this.marker, this.description, this._correct, this.questionId,
      this.isSelected);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
