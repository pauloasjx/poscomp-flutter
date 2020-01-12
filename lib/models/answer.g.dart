// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    json['id'] as int,
    json['marker'] as String,
    json['description'] as String,
    json['correct'] as int,
    json['question_id'] as int,
    json['isSelected'] as bool ?? false,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'marker': instance.marker,
      'description': instance.description,
      'correct': instance.correct,
      'isSelected': instance.isSelected,
      'question_id': instance.questionId,
    };
