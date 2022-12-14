import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/screens/save_exam.dart';
import 'package:kolko_je_za_pet/model.dart';

class ContinueSavingExamTextButton extends StatelessWidget {
  const ContinueSavingExamTextButton({
    Key? key,
    required this.bodoviController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (() {
          final exam = Exam(ukupanBrojBodova: int.parse(bodoviController.text));
          continueToSave(context, exam);
        }),
        child: const Text("Nastavi"));
  }

  final TextEditingController bodoviController;
  Future<dynamic> continueToSave(BuildContext context, Exam exam) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => SaveExam(
                  exam: exam,
                ))));
  }
}
