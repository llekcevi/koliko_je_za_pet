import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';
import 'package:kolko_je_za_pet/widgets/buttons/save_exam_elevated_button.dart';
import 'package:kolko_je_za_pet/widgets/text_fields/naziv_text_field.dart';
import 'package:kolko_je_za_pet/widgets/text_fields/razred_text_field.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveExam extends ConsumerStatefulWidget {
  const SaveExam({super.key, required this.exam});
  final Exam exam;

  @override
  ConsumerState<SaveExam> createState() => _SaveExamState();
}

class _SaveExamState extends ConsumerState<SaveExam> {
  @override
  Widget build(BuildContext context) {
    final exam = widget.exam;
    final nazivController = ref.read(nazivProvider);
    final razredController = ref.read(razredProvider);
    final bodoviController = ref.read(bodoviProvider);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NazivTextField(nazivController: nazivController),
                  const SizedBox(height: 20),
                  RazredTextField(razredController: razredController),
                  const SizedBox(height: 20),
                  GradesColumn(exam: exam),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            clearTextEditingProviders(nazivController,
                                razredController, bodoviController);
                            Navigator.of(context)
                                .popUntil(((route) => route.isFirst));
                          },
                          child: const Text("Odustani")),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: nazivController,
                        builder: (context, value, child) =>
                            SaveExamElevatedButton(
                                value: value,
                                exam: exam,
                                nazivController: nazivController,
                                razredController: razredController,
                                bodoviController: bodoviController),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
