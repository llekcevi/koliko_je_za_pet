import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';

class ShowPoints extends ConsumerWidget {
  const ShowPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.read(examProvider);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              GradesColumn(points: points),
            ],
          ),
        ),
      ),
    );
  }
}
