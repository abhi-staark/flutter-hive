import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:math';
import 'package:hive/hive.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  final _names = ["Alice", "Bob", "Charlie", "Diana", "Ethan", "Fiona"];
  final _strengths = [
    "Boxing",
    "Karate",
    "Wrestling",
    "Judo",
    "MMA",
    "Taekwondo"
  ];
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eample One'),
      ),
      body: Center(
        child: FutureBuilder<Box>(
          future: Hive.openBox('test_one'),
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return const CircularProgressIndicator();
            }

            final box = snapShot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  box.get('name', defaultValue: '') ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  box.get('strength', defaultValue: '') ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final box = Hive.box('test_one');
          box.put('name', _names[_random.nextInt(_names.length)]);
          box.put('strength', _strengths[_random.nextInt(_strengths.length)]);
          setState(() {}); // Refresh UI
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Hive saved ${box.get('name', defaultValue: '') ?? ''} as name")));
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
