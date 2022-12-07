import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/model.dart';

class ExamsList extends StatelessWidget {
  const ExamsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Exam>>(
      stream: readExams(),
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

Widget buildExam(Exam exam) => ListTile(
    title: Text("${exam.naziv}"), subtitle: Text(exam.razred.toString()));
