import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';
import 'package:kolko_je_za_pet/widgets/confirm_delete.dart';

class HiveExamsByRazred extends ConsumerWidget {
  const HiveExamsByRazred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final razred = ref.watch(razredFilterProvider);
    final exams = examsBox.values.where((element) => element.razred == razred);
    ref.watch(examListChangeProvider);
    return Expanded(
      child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: ((context, index) {
            Exam exam = exams.elementAt(index);
            return ValueListenableBuilder(
              valueListenable: examsBox.listenable(),
              builder: (context, value, child) => ExpansionTile(
                title: Text(exam.naziv!),
                children: [
                  GradesColumn(exam: exam),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ConfirmDelete(
                                        examToDelete: exam,
                                      ));
                            },
                            child: Text("Obriši")),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
