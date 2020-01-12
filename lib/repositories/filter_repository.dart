import 'package:poscomp/database/database_provider.dart';
import 'package:poscomp/models/filter.dart';
import 'package:poscomp/models/question.dart';

class FilterRepository {
  List<Filter> getTypes() {
    return [
      QuestionType.MAT,
      QuestionType.FUN,
      QuestionType.TEC,
    ].map((type) => Filter(type: type)).toList();
  }

  Future<List<Filter>> getYears() async {
    final database = await DBProvider.db.database;
    final result = await database.rawQuery("""
        SELECT DISTINCT YEAR FROM TEST;
      """);

    List<Filter> years = result.map((r) => Filter(year: r["year"])).toList();

    return years;
  }
}

final filterRepository = FilterRepository();
