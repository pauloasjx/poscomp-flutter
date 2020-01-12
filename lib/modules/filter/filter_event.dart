import 'package:poscomp/models/filter.dart';

class FilterEvent {}

class FetchFilter extends FilterEvent {}

class SelectFilter extends FilterEvent {
  final Filter filter;

  SelectFilter({this.filter});
}