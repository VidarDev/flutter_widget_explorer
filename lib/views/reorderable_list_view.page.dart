import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatefulWidget {
  const ReorderableListViewPage({super.key});

  @override
  State<ReorderableListViewPage> createState() => _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<String> _items = List.generate(
    20,
    (index) => 'Item ${index + 1}',
  );

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView Demo'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Basic ReorderableListView',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: _onReorder,
              children: _items.take(10).map((item) {
                return Card(
                  key: ValueKey(item),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ReorderableListView.builder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: _items.length,
              onReorder: _onReorder,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  key: ValueKey(item),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(item),
                    subtitle: Text('Position: ${index + 1}'),                  
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
