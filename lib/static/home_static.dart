import 'package:flutter/material.dart';
import 'package:poscomp/misc/custom_icons.dart';
import 'package:poscomp/modules/filter/filter_screen.dart';
import 'package:poscomp/modules/home/home_screen.dart';
import 'package:poscomp/modules/result/result_screen.dart';
import 'package:poscomp/modules/train/train_screen.dart';

var menus = [
  {
    'title': 'Treinar',
    'description': 'Treine em questões aleatórias com a possibilidade de escolha de filtros.',
    'icon': CustomIcons.ptrain,
    'startColor': Colors.green[800],
    'endColor': Colors.green[900],
    'route': TrainScreen()
  },
  {
    'title': 'Simular',
    'description': 'Simule provas inteiras e confira seu desempenho real.',
    'icon': CustomIcons.psimulate,
    'startColor': Colors.purple[800],
    'endColor': Colors.purple[900],
    'route': FilterScreen(filterType: FilterType.SIMULATE)
  },
  {
    'title': 'Provas e Gabaritos',
    'description': 'Veja os arquivos originais de provas anteriores.',
    'icon': CustomIcons.ptest,
    'startColor': Colors.orange[800],
    'endColor': Colors.orange[900],
    'route': ResultScreen()
  },
  {
    'title': 'Configurações',
    'description': 'Ajuste o app para melhor aproveitamento..',
    'icon': CustomIcons.pgear,
    'startColor': Colors.grey[500],
    'endColor': Colors.grey[600],
    'route': HomeScreen()
  }
];