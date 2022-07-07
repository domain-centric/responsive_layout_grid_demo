/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';
import 'package:responsive_layout_grid_demo/row_alignment_example.dart';
import 'package:responsive_layout_grid_demo/row_height_examample.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'cell_alignment_example.dart';
import 'column_example.dart';
import 'form_example.dart';
import 'news_paper_example.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('$ResponsiveLayoutGrid (resize me!)'),
      ),
      body: const SingleChildScrollView(
        child:
            Padding(padding: EdgeInsets.all(32), child: ResponsiveHomeGrid()),
      ));
}

class ResponsiveHomeGrid extends StatelessWidget {
  const ResponsiveHomeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ResponsiveLayoutGrid(
        maxNumberOfColumns: 2,
        children: [
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            columnSpan: ColumnSpan.remainingWidth(),
            child: const GroupBar("Examples"),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: ColumnsExamplePage.title,
              page: ColumnsExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${ColumnsExamplePage.title} Source Code',
              url: ColumnsExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: FormExamplePage.title,
              page: FormExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${FormExamplePage.title} Source Code',
              url: FormExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: NewsPaperExamplePage.title,
              page: NewsPaperExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${NewsPaperExamplePage.title} Source Code',
              url: NewsPaperExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: RowHeightExamplePage.title,
              page: RowHeightExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${RowHeightExamplePage.title} Source Code',
              url: RowHeightExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: RowAlignmentExamplePage.title,
              page: RowAlignmentExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${RowAlignmentExamplePage.title} Source Code',
              url: RowAlignmentExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const NavigateToPageButton(
              text: CellAlignmentExamplePage.title,
              page: CellAlignmentExamplePage(),
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: '${CellAlignmentExamplePage.title} Source Code',
              url: CellAlignmentExamplePage.urlToSourceCode,
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            columnSpan: ColumnSpan.remainingWidth(),
            child: const GroupBar("Documentation"),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextRow(),
            child: const OpenUrlButton(
              text: 'Material Design V2',
              url:
                  'https://material.io/design/layout/responsive-layout-grid.html',
            ),
          ),
          ResponsiveLayoutCell(
            position: CellPosition.nextColumn(),
            child: const OpenUrlButton(
              text: 'Material Design V3',
              url:
                  'https://m3.material.io/foundations/adaptive-design/large-screens/overview',
            ),
          ),
        ],
      );
}

class OpenUrlButton extends StatelessWidget {
  final String text;
  final String url;

  const OpenUrlButton({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
      onPressed: () {
        launchUrlString(url);
      },
      child: ButtonText(text));
}

class NavigateToPageButton extends StatelessWidget {
  final String text;
  final Widget page;

  const NavigateToPageButton({
    Key? key,
    required this.text,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: ButtonText(text));
}

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Text(text),
        ),
      );
}

class GroupBar extends StatelessWidget {
  final String title;

  const GroupBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey,
      child: Center(
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
      ));
}
