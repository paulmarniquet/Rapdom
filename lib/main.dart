import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const RandomGenerator());
}

class RandomGenerator extends StatelessWidget {
  const RandomGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
