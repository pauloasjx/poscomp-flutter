import 'package:poscomp/models/filter.dart';
import 'package:poscomp/models/question.dart';

class FilterState {
  final List<Question> questions;
  final List<Filter> filters;
  final String errorMessage;
  final bool isLoading;

  List<Filter> get years {
    return filters.where((filter) => filter.year != null).toList();
  }

  List<Filter> get types {
    return filters.where((filter) => filter.type != null).toList();
  }

  List<Filter> get selecteds {
    return filters.where((filter) => filter.isSelected).toList();
  }

  factory FilterState.empty() {
    return FilterState(
        filters: [], questions: [], errorMessage: null, isLoading: false);
  }

  FilterState(
      {this.filters, this.questions, this.errorMessage, this.isLoading});

  FilterState copyWith(
      {List<Filter> filters,
      List<Question> questions,
      String errorMessage,
      bool isLoading}) {
    return FilterState(
        filters: filters ?? this.filters,
        questions: questions ?? this.questions,
        errorMessage: errorMessage,
        isLoading: isLoading ?? this.isLoading);
  }
}
