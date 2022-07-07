/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';



class RowHeightExamplePage extends StatelessWidget {
  const RowHeightExamplePage({Key? key}) : super(key: key);
  static const title = 'Row Height';

  static const urlToSourceCode =
      'https://github.com/domain-centric/responsive_layout_grid_demo/blob/main/lib/row_height_examample.dart';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('$title Example (resize me!)'),
      ),
      body: SingleChildScrollView(
        child: ResponsiveLayoutGrid(
          maxNumberOfColumns: 3,
          padding: const EdgeInsets.all(8),
          children: [
            ResponsiveLayoutCell(
                columnSpan: ColumnSpan.remainingWidth(),
                position: CellPosition.nextRow(),
                child: const ExpandedColoredTextBox(
                    "Row Height = Highest Cell", Colors.yellow)),
            ResponsiveLayoutCell(
                position: CellPosition.nextRow(
                    rowHeight: RowHeight.highestCell()),
                child: ColoredTextBox(lines(1), Colors.yellow)),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ColoredTextBox(lines(2), Colors.yellow)),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ColoredTextBox(lines(3), Colors.yellow)),
            ResponsiveLayoutCell(
                columnSpan: ColumnSpan.remainingWidth(),
                position: CellPosition.nextRow(),
                child: const ExpandedColoredTextBox(
                    "Row Height = Expanded, flex=100 (=1/3 of remaining height)",
                    Colors.green)),
            ResponsiveLayoutCell(
                position: CellPosition.nextRow(
                    rowHeight: RowHeight.expanded(minHeight: 100)),
                child: ExpandedColoredTextBox(
                  lines(1),
                  Colors.green,
                  constraints:
                      const BoxConstraints(minHeight: 100, maxHeight: 200),
                )),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ExpandedColoredTextBox(lines(2), Colors.green)),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ExpandedColoredTextBox(lines(3), Colors.green)),
            ResponsiveLayoutCell(
                columnSpan: ColumnSpan.remainingWidth(),
                position: CellPosition.nextRow(),
                child: const ExpandedColoredTextBox(
                    "Row Height = Expanded, flex=200 (=2/3 of remaining height)",
                    Colors.orange)),
            ResponsiveLayoutCell(
                position: CellPosition.nextRow(
                    rowHeight: RowHeight.expanded(minHeight: 200)),
                child: ExpandedColoredTextBox(lines(1), Colors.orange)),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ExpandedColoredTextBox(lines(2), Colors.orange)),
            ResponsiveLayoutCell(
                position: CellPosition.nextColumn(),
                child: ExpandedColoredTextBox(lines(3), Colors.orange)),
          ],
        ),
      ));

  String lines(int numberOfLines) =>
      [for (int i = 1; i <= numberOfLines; i++) 'Line $i'].join('\n');
}

class ColoredTextBox extends StatelessWidget {
  final Color color;
  final String text;

  const ColoredTextBox(this.text, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ));
}

class ExpandedColoredTextBox extends StatelessWidget {
  final Color color;
  final String text;
  final BoxConstraints constraints;

  const ExpandedColoredTextBox(
    this.text,
    this.color, {
    this.constraints = const BoxConstraints(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      constraints: constraints,
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ));
}
