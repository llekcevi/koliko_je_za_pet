import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/screens/exams_list.dart';

class FilterExams extends StatefulWidget {
  const FilterExams({super.key});

  @override
  State<FilterExams> createState() => _FilterExamsState();
}

class _FilterExamsState extends State<FilterExams> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: filterRazred(6),
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
        });
  }
}
