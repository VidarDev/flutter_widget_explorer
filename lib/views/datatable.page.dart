import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  List<Produit> produits = List.generate(
    10,
        (index) => Produit(
      nom: 'Produit $index',
      prix: 19.99 + (index * 10),
      categorie: 'Catégorie ${index % 3 + 1}',
    ),
  );

  int? _sortColumnIndex;
  bool _isAscending = true;
  final Set<int> _selectedRows = {};

  void _sort<T>(Comparable<T> Function(Produit p) getField, int columnIndex) {
    setState(() {
      _isAscending = (_sortColumnIndex == columnIndex) ? !_isAscending : true;
      _sortColumnIndex = columnIndex;

      produits.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return _isAscending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _isAscending,
          columns: [
            DataColumn(
              label: Text('Nom'),
              onSort: (columnIndex, _) => _sort((p) => p.nom, columnIndex),
            ),
            DataColumn(label: Text('Prix')),
            DataColumn(label: Text('Catégorie')),
          ],
          rows: List.generate(produits.length, (index) {
            final produit = produits[index];
            final isSelected = _selectedRows.contains(index);

            return DataRow(
              selected: isSelected,
              onSelectChanged: (selected) {
                setState(() {
                  if (selected == true) {
                    _selectedRows.add(index);
                  } else {
                    _selectedRows.remove(index);
                  }
                });
              },
              cells: [
                DataCell(Text(produit.nom)),
                DataCell(Text('${produit.prix.toStringAsFixed(2)} €')),
                DataCell(Text(produit.categorie)),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class Produit {
  final String nom;
  final double prix;
  final String categorie;

  Produit({required this.nom, required this.prix, required this.categorie});
}