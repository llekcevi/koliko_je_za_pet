import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';

class RazredTabs extends StatelessWidget {
  const RazredTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var future = readExams();
    return FutureBuilder<List<Exam>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("something went wrong");
        } else if (snapshot.hasData) {
          final exams = snapshot.data!;
          List razredi = [];
          for (int exam = 0; exam < exams.length; exam++) {
            !razredi.contains(exams[exam].razred)
                ? razredi.add(exams[exam].razred)
                : null;
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: razredi.length,
              itemBuilder: (context, index) => Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width / 4,
                    child: ListTile(
                      title: Text(
                          textAlign: TextAlign.center,
                          razredi[index].toString()),
                    ),
                  ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget buildExam(Exam exam) => ExpansionTile(
      title: Text("${exam.naziv}"),
      subtitle: Text(exam.razred.toString()),
      children: [GradesColumn(exam: exam)],
    );
