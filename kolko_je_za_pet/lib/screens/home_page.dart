import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/widgets/filter_exams.dart';
import 'exams_list.dart';
import '../widgets/input_points_alert_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Expanded(child: ExamsList(future: readExams())),
          FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text("Dodaj novi ispit"),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => const InputPoints()))
        ],
      ))),
    ));
    ;
  }
}
