import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'home_page.dart';
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
                  //zamijeniti column custom widgetom
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Naziv ispita: "),
                      TextField(
                        controller: nazivController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Razred: "),
                      TextField(
                        controller: razredController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      )
                    ],
                  ),
                  GradesColumn(exam: exam),
                  ElevatedButton(
                      onPressed: () {
                        exam.naziv = nazivController.text;
                        exam.razred = int.parse(razredController.text);
                        writeExam(exam);
                        clearTextEditingProviders(nazivController,
                            razredController, bodoviController);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                      },
                      child: const Text("Završi")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                      },
                      child: const Text("ispiši ispite"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
