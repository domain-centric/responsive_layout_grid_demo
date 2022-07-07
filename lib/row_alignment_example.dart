/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

class RowAlignmentExamplePage extends StatelessWidget {
  const RowAlignmentExamplePage({Key? key}) : super(key: key);
  static const title = 'Row Alignment';

  static const urlToSourceCode =
      'https://github.com/domain-centric/responsive_layout_grid_demo/blob/main/lib/row_alignment_example.dart';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('$title Example (resize me!)'),
      ),
      body: SingleChildScrollView(
        child: ResponsiveLayoutGrid(
          maxNumberOfColumns: 6,
          padding: const EdgeInsets.all(8),
          children: [
            ..._createCells('right', RowAlignment.right, Colors.yellow),
            ..._createCells('left', RowAlignment.left, Colors.green),
            ..._createCells('center', RowAlignment.center, Colors.orange),
            ..._createCells('justify', RowAlignment.justify, Colors.blue),
          ],
        ),
      ));

  List<ResponsiveLayoutCell> _createCells(
      String text, RowAlignment rowAlignment, MaterialColor color) {
    List<ResponsiveLayoutCell> cells = [];

    cells.add(_createGroupBar(rowAlignment, text, color));

    for (int i = 0; i < 10; i++) {
      var min = 1;
      var preferred = min + randomInt(min: 0, max: 3);
      var max = preferred + randomInt(min: 0, max: 3);
      cells.add(_createCell(min, preferred, max, color));
    }
    return cells;
  }

  ResponsiveLayoutCell _createCell(
    int min,
    int preferred,
    int max,
    MaterialColor color,
  ) {
    return ResponsiveLayoutCell(
      position: CellPosition.nextColumn(),
      columnSpan: ColumnSpan.range(min: min, preferred: preferred, max: max),
      child: Container(
        color: color,
        child: Center(child: Text("min: $min, pref.: $preferred, max: $max")),
      ),
    );
  }

  ResponsiveLayoutCell _createGroupBar(
    RowAlignment rowAlignment,
    String text,
    MaterialColor color,
  ) {
    return ResponsiveLayoutCell(
      position: CellPosition.nextRow(rowAlignment: rowAlignment),
      columnSpan: ColumnSpan.remainingWidth(),
      child: Container(
        color: color,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text.toUpperCase()),
        )),
      ),
    );
  }
}

final Random _random = Random();

const _maxRandomInt = 4294967296; //2^32

/// Generates a random [int] value between and including [min] and [max]
int randomInt({int min = 0, int max = _maxRandomInt}) {
  var delta = max - min;
  if (delta == 0) {
    return min;
  } else {
    return _random.nextInt(delta + 1) + min;
  }
}
