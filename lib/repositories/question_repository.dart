import 'package:poscomp/database/database_provider.dart';
import 'package:poscomp/models/answer.dart';
import 'package:poscomp/models/question.dart';

class QuestionRepository {
  Future<Question> find(int id) async {
    final database = await DBProvider.db.database;
    final result =
    await database.rawQuery(
      """
        SELECT *, question.description AS question_description
        FROM
          question
        INNER JOIN answer on answer.question_id = question.id
        where question.id = ?
      """, [id]
    );

    List<Answer> answers = result.map((answer) => Answer.fromJson(answer)).toList();
    Question question = Question.fromJson(result.first);
    question.answers = answers;

    return question;
  }

  Future<Question> random() async {
    final database = await DBProvider.db.database;
    final result =
    await database.rawQuery(
        """
        SELECT *, question.description AS question_description
        FROM
          question
        INNER JOIN answer on answer.question_id = question.id
        ORDER BY RANDOM()
        LIMIT 1
      """
    );

    List<Answer> answers = result.map((answer) => Answer.fromJson(answer)).toList();
    Question question = Question.fromJson(result.first);
    question.answers = answers;

    return Question.fromJson(result.first);
  }
}

final questionRepository = QuestionRepository();