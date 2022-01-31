import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

double _width = 50;
double _height = 50;
Color _color = Colors.green;
BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.decelerate,
          duration: const Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration:
              BoxDecoration(color: _color, borderRadius: _borderRadiusGeometry),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cambiarForma(),
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadiusGeometry =
          BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
