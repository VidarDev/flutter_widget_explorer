import 'package:flutter/material.dart';

class GridViewsPage extends StatelessWidget {
  const GridViewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grid Views'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Count'),
              Tab(text: 'Builder'),
              Tab(text: 'Extent'),
              Tab(text: 'Aspect Ratio'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGridViewCount(),
            _buildGridViewBuilder(),
            _buildGridViewExtent(),
            _buildGridViewAspectRatio(),
          ],
        ),
      ),
    );
  }

  Widget _buildGridViewCount() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: List.generate(
        20,
        (index) => Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(Icons.image, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewBuilder() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.accents[index % Colors.accents.length],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(Icons.photo, color: Colors.white, size: 28),
          ),
        );
      },
    );
  }

  Widget _buildGridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: List.generate(
        25,
        (index) => Container(
          decoration: BoxDecoration(
            color: Colors.primaries[(index + 5) % Colors.primaries.length],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(Icons.photo_library, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewAspectRatio() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAspectRatioSection(0.5, 'Ratio 0.5'),
          _buildAspectRatioSection(1.0, 'Ratio 1.0'),
          _buildAspectRatioSection(1.5, 'Ratio 1.5'),
          _buildAspectRatioSection(2.0, 'Ratio 2.0'),
        ],
      ),
    );
  }

  Widget _buildAspectRatioSection(double ratio, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            childAspectRatio: ratio,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: List.generate(
              5,
              (index) => Container(
                decoration: BoxDecoration(
                  color:
                      Colors.primaries[(index + 10) % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, color: Colors.white, size: 32),
                      const SizedBox(height: 8),
                      Text(
                        'Ratio $ratio',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
