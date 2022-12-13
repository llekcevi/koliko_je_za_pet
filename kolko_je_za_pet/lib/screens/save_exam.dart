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
                  NazivTextField(nazivController: nazivController),
                  RazredTextField(razredController: razredController),
                  GradesColumn(exam: exam),
                  SaveExamElevatedButton(
                      exam: exam,
                      nazivController: nazivController,
                      razredController: razredController,
                      bodoviController: bodoviController),
                  ElevatedButton(
                      onPressed: () {
                        clearTextEditingProviders(nazivController,
                            razredController, bodoviController);
                        Navigator.of(context)
                            .popUntil(((route) => route.isFirst));
                      },
                      child: const Text("odustani"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SaveExamElevatedButton extends StatelessWidget {
  const SaveExamElevatedButton({
    Key? key,
    required this.exam,
    required this.nazivController,
    required this.razredController,
    required this.bodoviController,
  }) : super(key: key);

  final Exam exam;
  final TextEditingController nazivController;
  final TextEditingController razredController;
  final TextEditingController bodoviController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          exam.naziv = nazivController.text;
          exam.razred = int.parse(razredController.text);
          writeExam(exam);
          clearTextEditingProviders(
              nazivController, razredController, bodoviController);
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomePage())));
        },
        child: const Text("Završi"));
  }
}

class RazredTextField extends StatelessWidget {
  const RazredTextField({
    Key? key,
    required this.razredController,
  }) : super(key: key);

  final TextEditingController razredController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Razred: "),
        TextField(
          controller: razredController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        )
      ],
    );
  }
}

class NazivTextField extends StatelessWidget {
  const NazivTextField({
    Key? key,
    required this.nazivController,
  }) : super(key: key);

  final TextEditingController nazivController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Naziv ispita: "),
        TextField(
          controller: nazivController,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
