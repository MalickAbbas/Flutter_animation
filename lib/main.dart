import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Implicit Animations')),
        body: const Center(
          child: AnimatedContainerExample(),
        ),
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: AnimatedContainer(
        width: _selected ? 200.0 : 100.0,
        height: _selected ? 100.0 : 200.0,
        color: _selected ? Colors.blue : Colors.greenAccent,
        alignment: _selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: const FlutterLogo(size: 75),
      ),
    );
  }
}
