/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';


class ColumnsExamplePage extends StatelessWidget {
  const ColumnsExamplePage({Key? key}) : super(key: key);
  static const title = 'Columns';

  static const urlToSourceCode =
      'https://github.com/domain-centric/responsive_layout_grid_demo/blob/main/lib/column_example.dart';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('$title Example (resize me!)'),
      ),
      body:
          SingleChildScrollView(
        child:
            ResponsiveLayoutGrid(
              padding: const EdgeInsets.all(8),
              layoutFactory: MyLayoutFactory(),
              maxNumberOfColumns: 6,
            ),
      ));
}

/// A custom [ResponsiveLayoutFactory] to create the exact number of
/// [LayoutCell]s as the available number of columns
class MyLayoutFactory extends ResponsiveLayoutFactory {
  @override
  Layout create(LayoutDimensions layoutDimensions, List<Widget> children) {
    var layout = Layout(layoutDimensions);
    for (int i = 1; i <= layoutDimensions.numberOfColumns; i++) {
      layout.addCell(
        leftColumn: i,
        columnSpan: 1,
        rowHeightMode: RowHeight.expanded(minHeight: 100),
        rowNumber: 1,
        cell: Container(
          color: Colors.yellow,
          child: Center(
            child: Text("Column $i"),
          ),
        ),
      );
    }
    return layout;
  }
}
