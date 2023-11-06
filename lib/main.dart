import 'dart:ffi';
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

valueNotifier value = valueNotifier(value: 0.2);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("nguvc\n");
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritNotifier'),
      ),
      body: InheritedExameble(
        valnotifier: value,
        child: Builder(builder: (context) {
          return Column(children: [
            Slider(
              min: 0,
              max: 1,
              value:InheritedExameble.of(context),
              onChanged: (i) {
                print("$i\n");
                value.value = i;
              },
            ),
            Row(children: [
              Expanded(
                child: Opacity(
                  opacity:  value._value,
                  child: Container(
                    
                    height: 200,
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity:  value._value,
                  child: Container(
                    height: 200,
                    color: Colors.red,
                  ),
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
    if (val != _value) {
      _value = val;
      notifyListeners();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    print("addListener$listener\n");

    super.addListener(listener);
  }
}

class InheritedExameble extends InheritedNotifier<valueNotifier> {
  final valueNotifier valnotifier;
  final Widget child;

  const InheritedExameble(
      {super.key, required this.child, required this.valnotifier})
      : super(child: child, notifier: valnotifier);
  static double of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedExameble>()!
        .valnotifier
        ._value;
  }
}
