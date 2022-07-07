/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

class CellAlignmentExamplePage extends StatelessWidget {
  const CellAlignmentExamplePage({Key? key}) : super(key: key);
  static const title = 'Cell Alignment';

  static const urlToSourceCode =
      'https://github.com/domain-centric/responsive_layout_grid_demo/blob/main/lib/cell_alignment_example.dart';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('$title Example (resize me!)'),
        ),
        body: SingleChildScrollView(
          child: ResponsiveLayoutGrid(
            padding: const EdgeInsets.all(8),
            maxNumberOfColumns: 3,
            children: [
              ResponsiveLayoutCell(
                  position: CellPosition.nextRow(
                      rowHeight: RowHeight.expanded(minHeight: 100)),
                  child: const TextCell('Top Left', Alignment.topLeft)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child: const TextCell('Top Center', Alignment.topCenter)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child: const TextCell('Top Right', Alignment.topRight)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextRow(
                      rowHeight: RowHeight.expanded(minHeight: 100)),
                  child: const TextCell('Center Left', Alignment.centerLeft)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child: const TextCell('Center', Alignment.center)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child: const TextCell('Center Right', Alignment.centerRight)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextRow(
                      rowHeight: RowHeight.expanded(minHeight: 100)),
                  child: const TextCell('Bottom Left', Alignment.bottomLeft)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child:
                      const TextCell('Bottom Center', Alignment.bottomCenter)),
              ResponsiveLayoutCell(
                  position: CellPosition.nextColumn(),
                  child: const TextCell('Bottom Right', Alignment.bottomRight)),
            ],
          ),
        ),
      );
}

class TextCell extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const TextCell(this.text, this.alignment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      alignment: alignment,
      color: Colors.grey,
      child: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ));
}
