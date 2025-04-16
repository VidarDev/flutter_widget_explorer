import 'package:flutter/material.dart';

final List<Map<String, dynamic>> appItems = [
  {
    'title': 'Montagnes',
    'subtitle': 'Paysage de montagne',
    'description':
        'Les montagnes offrent de magnifiques paysages et des possibilités de randonnée.',
    'icon': Icons.terrain,
    'color': Colors.blue.shade200,
  },
  {
    'title': 'Plage',
    'subtitle': 'Bord de mer',
    'description':
        'Détendez-vous sur le sable fin et profitez du bruit apaisant des vagues.',
    'icon': Icons.beach_access,
    'color': Colors.amber.shade200,
  },
  {
    'title': 'Forêt',
    'subtitle': 'Sentiers forestiers',
    'description':
        'Explorez la nature luxuriante et écoutez les sons de la forêt.',
    'icon': Icons.forest,
    'color': Colors.green.shade200,
  },
  {
    'title': 'Ville',
    'subtitle': 'Exploration urbaine',
    'description':
        'Découvrez l\'architecture et la culture des centres urbains animés.',
    'icon': Icons.location_city,
    'color': Colors.purple.shade200,
  },
  {
    'title': 'Lac',
    'subtitle': 'Eaux calmes',
    'description':
        'Admirez le reflet des paysages dans les eaux tranquilles des lacs.',
    'icon': Icons.water,
    'color': Colors.cyan.shade200,
  },
];

class AdaptiveLayoutPage extends StatefulWidget {
  const AdaptiveLayoutPage({super.key});

  @override
  State<AdaptiveLayoutPage> createState() => _AdaptiveLayoutPageState();
}

class _AdaptiveLayoutPageState extends State<AdaptiveLayoutPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Layout')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            return _buildDesktopLayout(constraints);
          } else if (constraints.maxWidth > constraints.maxHeight) {
            return _buildLandscapeLayout(constraints);
          } else {
            return _buildPortraitLayout(constraints);
          }
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < constraints.maxHeight) {
            return BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedItemColor: appItems[_selectedIndex]['color'],
              unselectedItemColor: Colors.grey,
              items:
                  appItems.map((item) {
                    return BottomNavigationBarItem(
                      icon: Icon(item['icon']),
                      label: item['title'],
                    );
                  }).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BoxConstraints constraints) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appItems.length,
      itemBuilder: (context, index) {
        final item = appItems[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Icon(item['icon'], color: item['color']),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(item['title']),
                      ),
                      Text(item['subtitle']),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLandscapeLayout(BoxConstraints constraints) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          extended: false,
          destinations:
              appItems.map((item) {
                return NavigationRailDestination(
                  icon: Icon(item['icon']),
                  label: Text(item['title']),
                );
              }).toList(),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appItems.length,
            itemBuilder: (context, index) {
              final item = appItems[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Icon(item['icon'], color: item['color']),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(item['title']),
                            ),
                            Text(item['subtitle']),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Row(
      children: [
        NavigationRail(
          extended: true,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          minExtendedWidth: 200,
          destinations:
              appItems.map((item) {
                return NavigationRailDestination(
                  icon: Icon(item['icon']),
                  label: Text(item['title']),
                );
              }).toList(),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (constraints.maxWidth - 200) ~/ 400,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: appItems.length,
            itemBuilder: (context, index) {
              final item = appItems[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Icon(item['icon'], color: item['color']),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(item['title']),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(item['subtitle']),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Flexible(
                        child: Text(
                          item['description'],
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
