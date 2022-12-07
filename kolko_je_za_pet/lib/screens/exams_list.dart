import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/widgets/grades_column.dart';

class ExamsList extends StatelessWidget {
  const ExamsList({Key? key, required this.future}) : super(key: key);
  final Future future;
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

          return ListView(
            children: exams.map(buildExam).toList(),
          );
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
