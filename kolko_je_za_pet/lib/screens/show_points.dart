import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';
import 'package:kolko_je_za_pet/database_functions.dart';

class ShowPoints extends ConsumerWidget {
  const ShowPoints({super.key, required this.examObject});
  final Exam examObject;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              GradesColumn(
                exam: examObject,
              ),
              ElevatedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SaveExam(exam: examObject))))),
                  child: const Text("Spremi ispit"))
            ]),
          ),
        ),
      ),
    );
  }
}

class SaveExam extends ConsumerWidget {
  const SaveExam({super.key, required this.exam});
  final Exam exam;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Naziv ispita: "),
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  onSubmitted: ((value) {
                    exam.naziv = value;
                  }),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Razred: "),
                  TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onSubmitted: ((value) {
                        exam.razred = int.parse(value);
                      }))
                ],
              ),
              //u grades column proslijediti totalPOints pa unutar tog widgeta napraviti obejkt i pozvati funkciju getgrades za ispis ocjena?
              GradesColumn(exam: exam),
              ElevatedButton(
                  onPressed: () {
                    writeExam(exam);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ShowExam(exam: exam))));
                  },
                  child: const Text("Završi")),
              ElevatedButton(
                  onPressed: () {
                    getAllExams();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ShowExam(exam: exam))));
                  },
                  child: const Text("ispiši ispite"))
            ]),
          ),
        ),
      ),
    ));
  }
}

class ShowExam extends StatelessWidget {
  const ShowExam({super.key, required this.exam});
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(exam.toString()), GradesColumn(exam: exam)],
      ),
    ))));
  }
}
