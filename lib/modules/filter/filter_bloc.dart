import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poscomp/models/filter.dart';
import 'package:poscomp/repositories/filter_repository.dart';
import 'package:poscomp/repositories/question_repository.dart';
import './bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  @override
  FilterState get initialState => FilterState.empty();

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is FetchFilter) {
      try {
        yield currentState.copyWith(isLoading: true);

        final years = await filterRepository.getYears();
        final types = filterRepository.getTypes();

        List<Filter> filters = List<Filter>();
        filters.addAll(years);
        filters.addAll(types);

        yield currentState.copyWith(filters: filters, isLoading: false);
      } catch (e) {
        print(e.toString());
        yield currentState.copyWith(
            errorMessage: e.toString(), isLoading: false);
      }
    }

    if (event is SelectFilter) {
      List<Filter> filters = currentState.filters;
      final index = filters.indexOf(event.filter);
      filters[index].isSelected = !filters[index].isSelected;

      yield currentState.copyWith(filters: filters);
    }
  }
}
