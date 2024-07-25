import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Explicit Animations')),
        body: Center(
          child: AnimationControllerExample(),
        ),
      ),
    );
  }
}

class AnimationControllerExample extends StatefulWidget {
  @override
  _AnimationControllerExampleState createState() => _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: const Center(
          child: FlutterLogo(size: 100),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
    );
  }
}
