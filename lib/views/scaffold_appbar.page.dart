import 'package:flutter/material.dart';

// Page d'exploration des Scaffold et AppBar
class ScaffoldAppBarPage extends StatefulWidget {
  const ScaffoldAppBarPage({super.key});

  @override
  State<ScaffoldAppBarPage> createState() => _ScaffoldAppBarPageState();
}

class _ScaffoldAppBarPageState extends State<ScaffoldAppBarPage> {
  double _elevation = 4.0;
  Color _backgroundColor = Colors.blue;
  bool _showLeading = true;
  bool _centerTitle = false;
  final List<Widget> _actions = [
    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
  ];
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endFloat;
  bool _showFAB = true;
  bool _showDrawer = true;
  bool _showEndDrawer = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Scaffold & AppBar'),
        backgroundColor: _backgroundColor,
        elevation: _elevation,
        centerTitle: _centerTitle,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black,
        leading: _showLeading
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              )
            : null,
        actions: _actions,
      ),
      drawer: _showDrawer
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text('Nicolas Rocq'),
                    accountEmail: const Text('nrocq@keyneosoft.fr'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        'N',
                        style:
                            TextStyle(fontSize: 40.0, color: _backgroundColor),
                      ),
                    ),
                    margin: EdgeInsets.zero,
                  ),
                  DrawerHeader(
                    decoration: BoxDecoration(color: _backgroundColor),
                    child: const Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Paramètres'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      endDrawer: _showEndDrawer
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: _backgroundColor),
                    child: const Text(
                      'Menu Droit',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Informations'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Aide'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: _elevation,
              offset: Offset(0, -_elevation / 2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Informations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Aide',
            ),
          ],
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
        ),
      ),
      floatingActionButton: _showFAB
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: _backgroundColor,
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Personnalisez le Scaffold et AppBar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('AppBar Elevation: ${_elevation.toStringAsFixed(1)}'),
            Slider(
              value: _elevation,
              min: 0,
              max: 20,
              onChanged: (value) {
                setState(() {
                  _elevation = value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text('Couleur de fond:'),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10,
              children: [
                _colorButton(Colors.blue, 'Bleu'),
                _colorButton(Colors.green, 'Vert'),
                _colorButton(Colors.red, 'Rouge'),
                _colorButton(Colors.purple, 'Violet'),
                _colorButton(Colors.orange, 'Orange'),
                _colorButton(Colors.teal, 'Teal'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Afficher Leading'),
                    value: _showLeading,
                    onChanged: (value) {
                      setState(() {
                        _showLeading = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Titre centré'),
                    value: _centerTitle,
                    onChanged: (value) {
                      setState(() {
                        _centerTitle = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Actions:'),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text('Recherche'),
                    value: _actions.any(
                      (action) =>
                          (action as IconButton).icon is Icon &&
                          (action.icon as Icon).icon == Icons.search,
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _actions.add(
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          );
                        } else {
                          _actions.removeWhere(
                            (action) =>
                                (action as IconButton).icon is Icon &&
                                (action.icon as Icon).icon == Icons.search,
                          );
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: const Text('Favoris'),
                    value: _actions.any(
                      (action) =>
                          (action as IconButton).icon is Icon &&
                          (action.icon as Icon).icon == Icons.favorite,
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _actions.add(
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          );
                        } else {
                          _actions.removeWhere(
                            (action) =>
                                (action as IconButton).icon is Icon &&
                                (action.icon as Icon).icon == Icons.favorite,
                          );
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: const Text('Paramètres'),
                    value: _actions.any(
                      (action) =>
                          (action as IconButton).icon is Icon &&
                          (action.icon as Icon).icon == Icons.settings,
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _actions.add(
                            IconButton(
                              icon: const Icon(Icons.settings),
                              onPressed: () {},
                            ),
                          );
                        } else {
                          _actions.removeWhere(
                            (action) =>
                                (action as IconButton).icon is Icon &&
                                (action.icon as Icon).icon == Icons.settings,
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Drawer'),
                    value: _showDrawer,
                    onChanged: (value) {
                      setState(() {
                        _showDrawer = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text('End Drawer'),
                    value: _showEndDrawer,
                    onChanged: (value) {
                      setState(() {
                        _showEndDrawer = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Afficher FAB'),
                    value: _showFAB,
                    onChanged: (value) {
                      setState(() {
                        _showFAB = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (_showFAB) ...[
              const SizedBox(height: 10),
              const Text('Position du FAB:'),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _fabLocationButton(
                    FloatingActionButtonLocation.endFloat,
                    'Fin flottant',
                  ),
                  _fabLocationButton(
                    FloatingActionButtonLocation.centerFloat,
                    'Centre flottant',
                  ),
                  _fabLocationButton(
                    FloatingActionButtonLocation.startFloat,
                    'Début flottant',
                  ),
                  _fabLocationButton(
                    FloatingActionButtonLocation.endDocked,
                    'Fin arrimé',
                  ),
                  _fabLocationButton(
                    FloatingActionButtonLocation.centerDocked,
                    'Centre arrimé',
                  ),
                  _fabLocationButton(
                    FloatingActionButtonLocation.startDocked,
                    'Début arrimé',
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_showDrawer) {
                      _scaffoldKey.currentState?.openDrawer();
                    }
                  },
                  child: const Text('Ouvrir Drawer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_showEndDrawer) {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }
                  },
                  child: const Text('Ouvrir End Drawer'),
                ),
              ],
            ),
            const SizedBox(height: 100), // Pour permettre de faire défiler
          ],
        ),
      ),
    );
  }

  Widget _colorButton(Color color, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
      onPressed: () {
        setState(() {
          _backgroundColor = color;
        });
      },
      child: Text(label),
    );
  }

  Widget _fabLocationButton(
    FloatingActionButtonLocation location,
    String label,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _fabLocation == location ? _backgroundColor : null,
      ),
      onPressed: () {
        setState(() {
          _fabLocation = location;
        });
      },
      child: Text(label),
    );
  }
}
