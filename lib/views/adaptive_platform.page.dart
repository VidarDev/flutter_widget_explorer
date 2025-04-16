import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptivePlatformPage extends StatefulWidget {
  const AdaptivePlatformPage({Key? key}) : super(key: key);

  @override
  State<AdaptivePlatformPage> createState() => _AdaptivePlatformPageState();
}

class _AdaptivePlatformPageState extends State<AdaptivePlatformPage> {
  bool _useIosStyle = Platform.isIOS;
  String _textFieldValue = '';

  void _togglePlatform() {
    setState(() {
      _useIosStyle = !_useIosStyle;
    });
  }

  void _showAdaptiveDialog() {
    if (_useIosStyle) {
      showCupertinoDialog(
        context: context,
        builder:
            (context) => CupertinoAlertDialog(
              title: const Text('iOS Alert'),
              content: const Text('This is a Cupertino style alert dialog.'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoDialogAction(
                  child: const Text('OK'),
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Android Alert'),
              content: const Text('This is a Material style alert dialog.'),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
      );
    }
  }

  Widget _buildAdaptiveButton() {
    if (_useIosStyle) {
      return CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text('iOS Button'),
        onPressed: _showAdaptiveDialog,
      );
    } else {
      return ElevatedButton(
        child: const Text('Android Button'),
        onPressed: _showAdaptiveDialog,
      );
    }
  }

  Widget _buildAdaptiveTextField() {
    if (_useIosStyle) {
      return CupertinoTextField(
        placeholder: 'iOS Text Field',
        onChanged: (value) {
          setState(() {
            _textFieldValue = value;
          });
        },
      );
    } else {
      return TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Android Text Field',
        ),
        onChanged: (value) {
          setState(() {
            _textFieldValue = value;
          });
        },
      );
    }
  }

  Widget _buildPlatformToggle() {
    if (_useIosStyle) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Android'),
          CupertinoSwitch(
            value: _useIosStyle,
            onChanged: (value) {
              setState(() {
                _useIosStyle = value;
              });
            },
          ),
          const Text('iOS'),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Android'),
          Switch(
            value: _useIosStyle,
            onChanged: (value) {
              setState(() {
                _useIosStyle = value;
              });
            },
          ),
          const Text('iOS'),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use different scaffold based on platform style
    if (_useIosStyle) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Adaptive Platform'),
        ),
        child: SafeArea(child: _buildPageContent()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Adaptive Platform')),
        body: _buildPageContent(),
      );
    }
  }

  Widget _buildPageContent() {
    final platformInfo = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Selected Platform: ${_useIosStyle ? "iOS" : "Android"}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Actual Platform: ${Platform.isIOS
                ? "iOS"
                : Platform.isAndroid
                ? "Android"
                : "Other"}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          _buildPlatformToggle(),
          const SizedBox(height: 24),
          platformInfo,
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Adaptive Button:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildAdaptiveButton(),
          const SizedBox(height: 24),
          const Text(
            'Adaptive Text Field:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildAdaptiveTextField(),
          const SizedBox(height: 16),
          if (_textFieldValue.isNotEmpty)
            Text('Text entered: $_textFieldValue'),
          const SizedBox(height: 24),
          const Text(
            'Adaptive Alert Dialog:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _useIosStyle
              ? CupertinoButton(
                child: const Text('Show iOS Alert'),
                onPressed: _showAdaptiveDialog,
              )
              : ElevatedButton(
                child: const Text('Show Android Alert'),
                onPressed: _showAdaptiveDialog,
              ),
        ],
      ),
    );
  }
}
