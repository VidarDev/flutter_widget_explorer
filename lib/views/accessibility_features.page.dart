import 'package:flutter/material.dart';

class AccessibilityFeatures extends StatefulWidget {
  const AccessibilityFeatures({super.key});

  @override
  State<AccessibilityFeatures> createState() => _AccessibilityFeaturesState();
}

class _AccessibilityFeaturesState extends State<AccessibilityFeatures> {
  bool _showSemanticsDebug = false;
  bool _simulateScreenReader = false;
  bool _isElementVisible = true;
  bool _isElementOffstage = false;
  double _elementOpacity = 1.0;
  String _mouseRegionStatus = "Pas d'interaction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Démo d\'Accessibilité'),
        actions: [
          Tooltip(
            message: 'Simuler lecteur d\'écran',
            child: Switch(
              value: _simulateScreenReader,
              onChanged: (value) {
                setState(() {
                  _simulateScreenReader = value;
                });
                if (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mode lecteur d\'écran activé')),
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Simulation du lecteur d'écran
              if (_simulateScreenReader)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber.shade100,
                  child: Row(
                    children: const [
                      Icon(Icons.accessibility_new, color: Colors.orange),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Mode simulation lecteur d\'écran activé',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

              // Section Semantics
              _buildSectionTitle('Section Semantics'),
              SwitchListTile(
                title: const Text('Afficher les indications sémantiques'),
                subtitle: const Text('Visualise les étiquettes d\'accessibilité'),
                value: _showSemanticsDebug,
                onChanged: (bool value) {
                  setState(() {
                    _showSemanticsDebug = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Semantics(
                label: 'Bouton importance élevée',
                hint: 'Confirme l\'action en cours',
                button: true,
                enabled: true,
                child: ElevatedButton(
                  onPressed: () {
                    if (_simulateScreenReader) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lecteur d\'écran: "Bouton importance élevée, Confirme l\'action en cours"')),
                      );
                    }
                  },
                  child: const Text('Bouton avec semantics'),
                ),
              ),

              const SizedBox(height: 16),

              // Section Tooltips
              _buildSectionTitle('Section Tooltips'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: 'Tooltip sur icône',
                    child: IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {},
                    ),
                  ),
                  Tooltip(
                    message: 'Tooltip sur bouton',
                    waitDuration: const Duration(milliseconds: 500),
                    showDuration: const Duration(seconds: 2),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Bouton avec tooltip'),
                    ),
                  ),
                  Tooltip(
                    richMessage: TextSpan(
                      text: 'Tooltip ',
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'enrichi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(
                          text: ' avec mise en forme',
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Texte avec tooltip enrichi'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Section Visibilité
              _buildSectionTitle('Section Visibilité'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Visibility:'),
                  Switch(
                    value: _isElementVisible,
                    onChanged: (value) {
                      setState(() {
                        _isElementVisible = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Offstage:'),
                  Switch(
                    value: _isElementOffstage,
                    onChanged: (value) {
                      setState(() {
                        _isElementOffstage = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Opacity:'),
                  Slider(
                    value: _elementOpacity,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: _elementOpacity.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _elementOpacity = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Visibility(
                  visible: _isElementVisible,
                  child: Offstage(
                    offstage: _isElementOffstage,
                    child: Opacity(
                      opacity: _elementOpacity,
                      child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text(
                          'Élément de démonstration',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Section Interactions desktop
              _buildSectionTitle('Section Interactions desktop'),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _mouseRegionStatus = "Survolé";
                  });
                },
                onExit: (_) {
                  setState(() {
                    _mouseRegionStatus = "Pas d'interaction";
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: _mouseRegionStatus == "Survolé" ? Colors.green.shade200 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _mouseRegionStatus == "Survolé" ? Colors.green : Colors.grey,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Zone de détection de la souris: $_mouseRegionStatus',
                    style: TextStyle(
                      fontWeight: _mouseRegionStatus == "Survolé" ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Section Liste avec Scrollbar
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Élément de liste $index'),
                        subtitle: Text('Description de l\'élément $index'),
                        leading: const Icon(Icons.list),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.blue.shade300)),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}