/*
 * Copyright (c) 2022. By Nils ten Hoeve. See LICENSE file in project.
 */

import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

const maxNumberOfColumns = 8;

class FormExamplePage extends StatelessWidget {
  const FormExamplePage({Key? key}) : super(key: key);
  static const title = 'Form';

  static const urlToSourceCode =
      'https://github.com/domain-centric/responsive_layout_grid_demo/blob/main/lib/form_example.dart';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sport Camp Registration Form (resize me!)'),
        ),
        body: const SingleChildScrollView(
          child:
              ResponsiveFormGrid(),
        ),
      );
}

class ResponsiveFormGrid extends StatelessWidget {
  const ResponsiveFormGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ResponsiveLayoutGrid(
    padding: const EdgeInsets.all(8),
        maxNumberOfColumns: maxNumberOfColumns,
        children: [
          _createGroupBar('Participant'),
          _createTextField(
            label: 'Given name',
            position: CellPosition.nextRow(),
          ),
          _createTextField(
            label: 'Family name',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
            label: 'Date of birth',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
              label: 'Remarks (e.g. medicines and allergies)',
              position: CellPosition.nextRow(),
              columnSpan: const ColumnSpan.size(3),
              maxLines: 5),
          _createGroupBar('Home Address'),
          _createTextField(
              label: 'Street', position: CellPosition.nextRow(), maxLines: 2),
          _createTextField(
            label: 'City',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
            label: 'Region',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
            label: 'Postal code',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
            label: 'Country',
            position: CellPosition.nextColumn(),
          ),
          _createGroupBar('Consent'),
          _createTextField(
            label: 'Given name of parent or guardian',
            position: CellPosition.nextRow(),
          ),
          _createTextField(
            label: 'Family name of parent or guardian',
            position: CellPosition.nextColumn(),
          ),
          _createTextField(
            label: 'Phone number of parent or guardian',
            position: CellPosition.nextRow(),
          ),
          _createTextField(
            label: 'Second phone number in case of emergency',
            position: CellPosition.nextColumn(),
          ),
          ResponsiveLayoutCell(
              position: CellPosition.nextRow(),
              child: const SizedBox(height: 8)),
          ResponsiveLayoutCell(
              position: CellPosition.nextRow(rowAlignment: RowAlignment.right),
              child: const CancelButton()),
          ResponsiveLayoutCell(
              position: CellPosition.nextColumn(), child: const SubmitButton()),
        ],
      );

  ResponsiveLayoutCell _createGroupBar(String title) => ResponsiveLayoutCell(
        position: CellPosition.nextRow(),
        columnSpan: ColumnSpan.remainingWidth(),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey,
          child: Center(
            child: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      );

  ResponsiveLayoutCell _createTextField({
    required String label,
    required CellPosition position,
    ColumnSpan columnSpan = const ColumnSpan.size(2),
    int maxLines = 1,
  }) =>
      ResponsiveLayoutCell(
        position: position,
        columnSpan: columnSpan,
        child: TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
              label: Text(label),
              filled: true,
              border: const OutlineInputBorder()),
        ),
      );
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Center(
              child:
                  Padding(padding: EdgeInsets.all(16), child: Text('Submit'))),
        ),
      );
}

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Center(
            child: Padding(padding: EdgeInsets.all(16), child: Text('Cancel'))),
      );
}
