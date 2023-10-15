import 'dart:math';

import 'package:angurrioso/cube.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angurrioso',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _rx = 0.0, _ry = 0.0, _rz = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, .001)
                ..rotateX(_rx)
                ..rotateY(_ry)
                ..rotateZ(_rz),
              alignment: FractionalOffset.center,
              child: Center(
                child: Cube(
                  rx: _rx,
                  ry: _ry,
                  rz: _rz,
                  left: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    child: const Text('Izquierda'),
                  ),
                  right: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: const Text('Derecha'),
                  ),
                  back: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text('Atras'),
                  ),
                  front: Container(
                    alignment: Alignment.center,
                    color: Colors.indigo,
                    child: const Text('Adelante'),
                  ),
                  top: Container(
                    alignment: Alignment.center,
                    color: Colors.purple,
                    child: const Text('Arriba'),
                  ),
                  bottom: Container(
                    alignment: Alignment.center,
                    color: Colors.tealAccent,
                    child: const Text('Abajo'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Slider(
            value: _rx,
            min: pi * -2,
            max: pi * 2,
            onChanged: (value) {
              setState(() {
                setState(() => _rx = value);
              });
            },
          ),
          Slider(
            value: _ry,
            min: pi * -2,
            max: pi * 2,
            divisions: 36,
            onChanged: (value) {
              setState(() {
                setState(() => _ry = value);
              });
            },
          ),
          Slider(
            value: _rz,
            min: pi * -2,
            max: pi * 2,
            onChanged: (value) {
              setState(() {
                setState(() => _rz = value);
              });
            },
          ),
        ],
      ),
    );
  }
}
