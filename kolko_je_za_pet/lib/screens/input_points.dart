import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model.dart';
import 'show_points.dart';

class InputPoints extends ConsumerWidget {
  InputPoints({
    Key? key,
  }) : super(key: key);

  final Exam examObject = Exam();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onSubmitted: ((value) {
          examObject.ukupanBrojBodova = int.parse(value);
          print(examObject);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ShowPoints(examObject: examObject))));
        }),
      ),
    );
  }
}
