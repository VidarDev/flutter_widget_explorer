import 'package:flutter/material.dart';

// Page d'exploration de Padding et SizedBox
class PaddingSizedBoxPage extends StatefulWidget {
  const PaddingSizedBoxPage({super.key});

  @override
  State<PaddingSizedBoxPage> createState() => _PaddingSizedBoxPageState();
}

class _PaddingSizedBoxPageState extends State<PaddingSizedBoxPage> {
  double _paddingLeft = 0;
  double _paddingTop = 0;
  double _paddingRight = 0;
  double _paddingBottom = 0;
  double _sizedBoxWidth = 100;
  double _sizedBoxHeight = 100;
  bool _showSizedBoxChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding & SizedBox'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Padding',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              width: 300,
              height: 300,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    _paddingLeft,
                    _paddingTop,
                    _paddingRight,
                    _paddingBottom,
                  ),
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Contenu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Padding gauche: ${_paddingLeft.toInt()}'),
                  Slider(
                    value: _paddingLeft,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _paddingLeft = value;
                      });
                    },
                  ),
                  Text('Padding haut: ${_paddingTop.toInt()}'),
                  Slider(
                    value: _paddingTop,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _paddingTop = value;
                      });
                    },
                  ),
                  Text('Padding droit: ${_paddingRight.toInt()}'),
                  Slider(
                    value: _paddingRight,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _paddingRight = value;
                      });
                    },
                  ),
                  Text('Padding bas: ${_paddingBottom.toInt()}'),
                  Slider(
                    value: _paddingBottom,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _paddingBottom = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            const Text(
              'SizedBox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              width: 300,
              height: 300,
              child: Center(
                child: SizedBox(
                  width: _sizedBoxWidth,
                  height: _sizedBoxHeight,
                  child: _showSizedBoxChild
                      ? Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              'SizedBox\navec enfant',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Largeur SizedBox: ${_sizedBoxWidth.toInt()}'),
                  Slider(
                    value: _sizedBoxWidth,
                    min: 0,
                    max: 300,
                    onChanged: (value) {
                      setState(() {
                        _sizedBoxWidth = value;
                      });
                    },
                  ),
                  Text('Hauteur SizedBox: ${_sizedBoxHeight.toInt()}'),
                  Slider(
                    value: _sizedBoxHeight,
                    min: 0,
                    max: 300,
                    onChanged: (value) {
                      setState(() {
                        _sizedBoxHeight = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Afficher l\'enfant'),
                    value: _showSizedBoxChild,
                    onChanged: (value) {
                      setState(() {
                        _showSizedBoxChild = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
