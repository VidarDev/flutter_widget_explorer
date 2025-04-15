import 'package:flutter/material.dart';
import 'package:flutter_widget_explorer/views/infinite_scrolling.page.dart';
import 'package:flutter_widget_explorer/views/center_align.page.dart';
import 'package:flutter_widget_explorer/views/container_explorer.page.dart';
import 'package:flutter_widget_explorer/views/expanded_spacer.page.dart';
import 'package:flutter_widget_explorer/views/padding_sizedbox.page.dart';
import 'package:flutter_widget_explorer/views/row_column.page.dart';
import 'package:flutter_widget_explorer/views/scaffold_appbar.page.dart';
import 'package:flutter_widget_explorer/views/stack_position.page.dart';

// At the top of your HomePage class
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(const WidgetExplorerApp());
}

class WidgetExplorerApp extends StatelessWidget {
  const WidgetExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorateur de Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Explorateur de Widgets')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Widgets de structure',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.crop_square),
              title: const Text('Containers'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContainerExplorerPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.space_bar),
              title: const Text('Padding & SizedBox'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaddingSizedBoxPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.align_horizontal_center),
              title: const Text('Center & Align'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CenterAlignPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_column),
              title: const Text('Row & Column'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RowColumnPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.expand),
              title: const Text('Expanded & Spacer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpandedSpacerPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.layers),
              title: const Text('Stack & Positioned'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StackPositionedPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Scaffold & AppBar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Cards & ListTiles'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Chips & FilterChips'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Progress Indicators'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Carousel'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('SearchBar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('ListViews'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('GridViews'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Scaffold & AppBar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('DataTable'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('CustomScrollView & Slivers'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScaffoldAppBarPage(),
                  ),
                );
              },
            ),
            const Divider(thickness: 2),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade400,
                    Colors.blue.shade400,
                    Colors.pink.shade400,
                    Colors.purple.shade400,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: const Icon(
                    Icons.airline_seat_recline_normal_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  title: const Text(
                    '✨ Infinite Scrolling ✨',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfiniteScrollingPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(thickness: 2),
          ],
        ),
      ),
      endDrawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Cette application vous permet d\'explorer les widgets de structure de base de Flutter.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Utilisez le menu à gauche pour accéder aux différentes pages de démonstration.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Dans chaque page, vous pourrez manipuler les propriétés des widgets pour mieux comprendre leur fonctionnement.',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                'Version 1.0',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.widgets, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Explorateur de Widgets de Structure',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Ouvrez le menu de gauche pour explorer les différents widgets de structure de base dans Flutter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.menu),
              label: const Text('Ouvrir le menu'),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text('Informations'),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
