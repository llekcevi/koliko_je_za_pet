import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

class ShowPoints extends ConsumerWidget {
  const ShowPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.read(examProvider);

    return Column(
      children: [
        Text(points[0].toString()),
        Text(points[1].toString()),
        Text(points[2].toString()),
        Text(points[3].toString()),
        Text(points[4].toString()),
      ],
    );
  }
}
