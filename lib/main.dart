import 'package:flutter/material.dart';
import 'package:flutter_widget_explorer/views/adaptive_platform.page.dart';
import 'package:flutter_widget_explorer/views/adaptative_layout.page.dart';
import 'package:flutter_widget_explorer/views/card_and_list.page.dart';
import 'package:flutter_widget_explorer/views/center_align.page.dart';
import 'package:flutter_widget_explorer/views/chips.page.dart';
import 'package:flutter_widget_explorer/views/container_explorer.page.dart';
import 'package:flutter_widget_explorer/views/datatable.page.dart';
import 'package:flutter_widget_explorer/views/expanded_spacer.page.dart';
import 'package:flutter_widget_explorer/views/grid_views.page.dart';
import 'package:flutter_widget_explorer/views/infinite_scrolling.page.dart';
import 'package:flutter_widget_explorer/views/kanban_board.page.dart';
import 'package:flutter_widget_explorer/views/padding_sizedbox.page.dart';
import 'package:flutter_widget_explorer/views/progress_indicators.page.dart';
import 'package:flutter_widget_explorer/views/pull_to_refresh.page.dart';
import 'package:flutter_widget_explorer/views/reorderable_list_view.page.dart';
import 'package:flutter_widget_explorer/views/row_column.page.dart';
import 'package:flutter_widget_explorer/views/scaffold_appbar.page.dart';
import 'package:flutter_widget_explorer/views/scollviews_slivers.page.dart';
import 'package:flutter_widget_explorer/views/search_bar.page.dart';
import 'package:flutter_widget_explorer/views/stack_position.page.dart';
import 'package:flutter_widget_explorer/views/media_query.page.dart';
import 'package:flutter_widget_explorer/views/clip_and_shapes.page.dart';

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
                  MaterialPageRoute(builder: (context) => const CardsAndList()),
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
                  MaterialPageRoute(builder: (context) => const Chips()),
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
                    builder: (context) => const ProgressIndicatorsPage(),
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
                  MaterialPageRoute(builder: (context) => SearchBarPage()),
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
                    builder: (context) => const GridViewsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Pull-to-Refresh'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PullToRefreshPage(),
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
                  MaterialPageRoute(builder: (context) => DataTablePage()),
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
                    builder: (context) => const CustomScrollViewPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('GraphicsView & ChartWidgets'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Container()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('CustomPainter & Canvas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Container()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Clip & Shapes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClipAndShapesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Adaptive Layouts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdaptiveLayoutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Adaptive Platform Widgets'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdaptivePlatformPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Media Query'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MediaQueryViewPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Accessibility Features'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Container()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Draggable & DragTarget'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KanbanPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('LongPressDraggable'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Container()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('ReorderableListView'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReorderableListViewPage()),
                );
              },
            ),
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
