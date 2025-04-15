import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({super.key});

  @override
  State<CustomScrollViewPage> createState() => CustomScrollViewPageState();
}

class CustomScrollViewPageState extends State<CustomScrollViewPage> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView & Slivers'),
              background: Image.network(
                'https://images.unsplash.com/photo-1516627145497-ae6968895b74?q=80&w=3480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(
                child: Text("SliverList", style: TextStyle(fontSize: 24)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            }, childCount: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(
                child: Text("SliverGrid", style: TextStyle(fontSize: 24)),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            }, childCount: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(
                child: Text(
                  "SliverFixedExtentList",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 500.0,
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
