import 'package:flutter/material.dart';

class Pair {
  int value;
  String name;
  Pair(this.value, this.name);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Pair myPair = Pair(3, 'hello');
  List<Pair> myList = [
    Pair(3, 'Hell'),
    Pair(4, 'Hades'),
    Pair(7, 'Zeus'),
  ];

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'CSEDU',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('List Sorting Tutorial'),
          ),
          body: const Center(
            child: Text('Hello#  '),
          )),
    );
  }
}
