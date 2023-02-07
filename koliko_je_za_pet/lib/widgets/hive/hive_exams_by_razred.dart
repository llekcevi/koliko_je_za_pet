import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';

class HiveExamsByRazred extends ConsumerWidget {
  const HiveExamsByRazred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final razred = ref.watch(razredFilterProvider);
    final exams = examsBox.values.where((element) => element.razred == razred);

    return Expanded(
      child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: ((context, index) {
            Exam exam = exams.elementAt(index);
            return ExpansionTile(
              title: Text(exam.naziv!),
              children: [GradesColumn(exam: exam)],
            );
          })),
    );
  }
}
