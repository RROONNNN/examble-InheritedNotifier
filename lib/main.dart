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
  valueNotifier value = valueNotifier(value: 0);
  @override
  Widget build(BuildContext context) {
    print("nguvc\n");
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritNotifier'),
      ),
      body: InheritedExameble(
        val:value ,
        child: Builder(builder: (context) {
          return Column(children: [
            Slider(
              min: 0,
              max: 10,
              value: value.value,
              onChanged: (i) {
                print("$i\n");
                value.value = i;
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
          ]);
        }),
      ),
    );
  }
}

class valueNotifier extends ChangeNotifier {
  double _value = 0;

  valueNotifier({required double value}) : _value = value;

  double get value => _value;
  void set value(double val) {
    print("val\n");
    _value = val;
    notifyListeners();
  }
}
class InheritedExameble extends InheritedNotifier<valueNotifier> {
  final valueNotifier val;
  final Widget child;

  const InheritedExameble({super.key, required this.child, required this.val})
      : super(child: child, notifier: val);
}
