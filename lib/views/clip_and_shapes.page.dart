import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClipAndShapesPage extends StatefulWidget {
  const ClipAndShapesPage({super.key});

  @override
  State<ClipAndShapesPage> createState() => _ClipAndShapesPageState();
}

class _ClipAndShapesPageState extends State<ClipAndShapesPage> with SingleTickerProviderStateMixin {
  double _borderRadius = 20.0;
  late AnimationController _waveController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _waveAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_waveController);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip & Shapes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ClipRRect - Rounded Corners',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: Image.network(
                'https://picsum.photos/300/200',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Slider(
              value: _borderRadius,
              min: 0,
              max: 50,
              divisions: 10,
              label: _borderRadius.round().toString(),
              onChanged: (value) {
                setState(() {
                  _borderRadius = value;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'ClipOval - Circular Shape',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ClipOval(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
                child: const Center(
                  child: Icon(
                    Icons.star,
                    size: 100,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'ClipPath - Custom Wave Shape',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            AnimatedBuilder(
              animation: _waveAnimation,
              builder: (context, child) {
                return ClipPath(
                  clipper: WaveClipper(_waveAnimation.value),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.purple,
                    child: const Center(
                      child: Icon(
                        Icons.waves,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double offset;

  WaveClipper(this.offset);

  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0, height * 0.5);

    for (var i = 0.0; i < width; i++) {
      path.lineTo(
        i,
        height * 0.5 + math.sin((i / width * 2 * math.pi) + offset) * 20,
      );
    }

    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
