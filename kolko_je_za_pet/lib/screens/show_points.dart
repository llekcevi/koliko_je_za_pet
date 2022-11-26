import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';

class ShowPoints extends ConsumerWidget {
  const ShowPoints({super.key, required this.examObject});
  final Exam examObject;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final points = ref.read(examGradesProvider);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //GradesColumn(points: points),
              Text(examObject.toString()),
              ElevatedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SaveExam(exam: examObject))))),
                  child: const Text("Spremi"))
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
    final totalPoints = ref.read(examTotalPointsProvider);

    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Naziv ispita: "),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                onSubmitted: ((value) {
                  exam.label = value;
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
                      exam.classNumber = int.parse(value);
                    }))
              ],
            ),
            //u grades column proslijediti totalPOints pa unutar tog widgeta napraviti obejkt i pozvati funkciju getgrades za ispis ocjena?
            GradesColumn(exam: exam),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ShowExam(exam: exam))));
                },
                child: const Text("Završi"))
          ]),
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
