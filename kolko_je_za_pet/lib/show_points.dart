import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

class ShowPoints extends ConsumerWidget {
  const ShowPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.read(examProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ukupan broj bodova: ${points[0].first}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Odličan: ${points[0].first} - ${points[0].last}"),
              Text("Vrlo dobar: ${points[1].first} - ${points[1].last}"),
              Text("Dobar: ${points[2].first} - ${points[2].last}"),
              Text("Dovoljan: ${points[3].first} - ${points[3].last}"),
              Text("Nedovoljan: ${points[4].first} - ${points[4].last}"),
            ],
          ),
        ),
      ),
    );
  }
}
