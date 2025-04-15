import 'package:flutter/material.dart';

// Page d'exploration de l'Inifinite scrolling
class InfiniteScrollingPage extends StatefulWidget {
  const InfiniteScrollingPage({super.key});

  @override
  State<InfiniteScrollingPage> createState() => _InfiniteScrollingPageState();
}

class _InfiniteScrollingPageState extends State<InfiniteScrollingPage> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _items = [];
  bool _isLoading = false;
  int _currentPage = 0;
  static const int _itemsPerPage = 20;

  @override
  void initState() {
    super.initState();
    // la on charge les premiers éléments
    _loadMoreItems();
    // event listener du scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // quand on arrive a la fin on load plus d'items
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // ça simule un délai de 1 seconde ça
    await Future.delayed(const Duration(seconds: 1));

    final newItems = List.generate(
      _itemsPerPage,
      (index) => 'Item ${_currentPage * _itemsPerPage + index + 1}',
    );

    setState(() {
      _items.addAll(newItems);
      _currentPage++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Scrolling')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          }
          return ListTile(title: Text(_items[index]));
        },
      ),
    );
  }
}
