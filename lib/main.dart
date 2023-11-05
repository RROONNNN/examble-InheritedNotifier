import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    print("nguvc\n");
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritNotifier'),
      ),
      body: Column(children: [
        Slider(
          min: 0,
          max: 10,
          value: value,
          onChanged: (i) {
            print("$i\n");
            setState(() {
              value = i;
            });
          },
        ),
        Row(children: [
          Expanded(
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              color: Colors.red,
            ),
          ),
        ]),
      ]),
    );
  }
}
