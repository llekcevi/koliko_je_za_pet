import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model.dart';
import '../provider.dart';
import 'show_points.dart';

class InputPoints extends ConsumerWidget {
  const InputPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Exam exam;

    return SizedBox(
      width: 100,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onSubmitted: ((value) {
          (exam = Exam(totalPoints: int.parse(value)));
          ref.read(examProvider.notifier).state =
              exam.getGrades(int.parse(value));
          //print(exam.getGrades(int.parse(value)));
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ShowPoints())));
        }),
      ),
    );
  }
}
