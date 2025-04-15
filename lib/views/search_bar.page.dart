import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SearchBar Demo',
      theme: ThemeData(useMaterial3: true),
      home: SearchBarPage(),
    );
  }
}

class SearchBarPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchBarPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> allItems = ['Chaise', 'Table', 'Tableau', 'Bureau', 'Echelle', 'Règle', 'Equerre', 'Compas'];
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _controller.text.isEmpty) {
        setState(() {
          suggestions = List.from(allItems);
        });
      }
    });
  }

  void _filterSearch(String query) {
    final results = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      suggestions = results;
    });
  }

  void _submitSearch(String query) {
    print('Recherche soumise: $query');
  }

  void _clearSearch() {
    _controller.clear();
    setState(() {
      suggestions = [];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barre de Recherche')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: _filterSearch,
                onSubmitted: _submitSearch,
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: _clearSearch,
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final item = suggestions[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      _controller.text = item;
                      _submitSearch(item);
                      FocusScope.of(context).unfocus();
                      setState(() => suggestions = []);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
