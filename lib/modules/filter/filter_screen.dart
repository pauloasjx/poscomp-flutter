import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poscomp/models/question.dart';
import 'package:poscomp/modules/filter/bloc.dart';
import 'package:poscomp/modules/question/question_screen.dart';
import 'package:poscomp/widgets/base_back_button.dart';
import 'package:poscomp/widgets/base_loading_overlay.dart';
import 'package:poscomp/widgets/base_outline_button.dart';
import 'package:poscomp/widgets/base_raised_button.dart';
import 'package:poscomp/widgets/base_title.dart';

enum FilterType { TRAIN, SIMULATE }

Color filterTypeColor(FilterType type, int value) {
  switch (type) {
    case FilterType.TRAIN:
      return Colors.green[value];
    case FilterType.SIMULATE:
      return Colors.purple[value];
    default:
      return null;
  }
}

class FilterScreen extends StatefulWidget {
  final FilterType filterType;

  const FilterScreen({this.filterType});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = FilterBloc();
    _filterBloc.dispatch(FetchFilter());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: _filterBloc,
          builder: (context, FilterState state) {
            return SafeArea(
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseBackButton(),
                        BaseTitle('Filtros',
                            color: filterTypeColor(widget.filterType, 900)),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Text('Selecione os filtros.'),
                        ),
                        widget.filterType == FilterType.TRAIN
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 32.0),
                                  Text('Filtrar por Tópico'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.types.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.all(8.0),
                                          child: Ink(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: state.types[index]
                                                          .isSelected
                                                      ? filterTypeColor(
                                                          widget.filterType,
                                                          100)
                                                      : Colors.grey[100]),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                onTap: () => {
                                                  _filterBloc.dispatch(
                                                      SelectFilter(
                                                          filter: state
                                                              .types[index]))
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Text(questionTypeName(
                                                      state.types[index].type)),
                                                ),
                                              )),
                                        );
                                      }),
                                ],
                              )
                            : Container(),
                        SizedBox(height: 32.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Filtrar por Ano'.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.years.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Ink(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: state.years[index].isSelected
                                                ? filterTypeColor(
                                                    widget.filterType, 100)
                                                : Colors.grey[100]),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          onTap: () => {
                                            _filterBloc.dispatch(SelectFilter(
                                                filter: state.years[index]))
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(state.years[index].year
                                                .toString()),
                                          ),
                                        )),
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 32.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.0, 16.0, 4.0, 8.0),
                            child: BaseOutlineButton(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  filterTypeColor(widget.filterType, 800),
                                  filterTypeColor(widget.filterType, 900)
                                ],
                              ),
                              radius: 6,
                              strokeWidth: 2,
                              child: Text('Voltar'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: filterTypeColor(
                                          widget.filterType, 900))),
                              onPressed: () => {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(4.0, 16.0, 0.0, 8.0),
                            child: BaseRaisedButton(
                              radius: 8,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  filterTypeColor(widget.filterType, 800),
                                  filterTypeColor(widget.filterType, 900)
                                ],
                              ),
                              child: Text('Filtrar'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuestionScreen(
                                            filterType: widget.filterType)))
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
