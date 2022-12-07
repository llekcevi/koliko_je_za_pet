import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/screens/save_exam.dart';
import 'package:kolko_je_za_pet/model.dart';

class InputPoints extends ConsumerWidget {
  const InputPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodoviController = ref.read(bodoviProvider);

    return AlertDialog(
      title: const Text("Broj bodova"),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      content: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: bodoviController,
      ),
      actions: [
        TextButton(
            onPressed: (() {
              bodoviController.clear();
              Navigator.pop(context);
            }),
            child: const Text("Odustani")),
        TextButton(
            onPressed: (() {
              final exam =
                  Exam(ukupanBrojBodova: int.parse(bodoviController.text));
              continueToSave(context, exam);
            }),
            child: const Text("Nastavi")),
      ],
    );
  }

  Future<dynamic> continueToSave(BuildContext context, Exam exam) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => SaveExam(
                  exam: exam,
                ))));
  }
}
