import 'package:poscomp/models/question.dart';


class Filter {

  int year;

  QuestionType type;

  bool isSelected;

  Filter({this.year, this.type, this.isSelected=false});

}