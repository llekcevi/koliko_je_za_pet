import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/input_points.dart';

void main() {
  runApp(const ProviderScope(child: KolkoJeZaPet()));
}

class KolkoJeZaPet extends StatelessWidget {
  const KolkoJeZaPet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: InputPoints(),
        ),
      ),
    );
  }
}
