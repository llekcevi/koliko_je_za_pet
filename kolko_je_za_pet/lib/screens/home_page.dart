import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'package:kolko_je_za_pet/widgets/hive/hive_exams_by_razred.dart';
import 'package:kolko_je_za_pet/widgets/buttons/add_new_exam_floating_action_button.dart';
import 'package:kolko_je_za_pet/auth/authetication.dart';

import '../widgets/hive/hive_razred_filters.dart';

//sync funkcija bi trebala odmah osvježiti homepage

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//extract custom appBar widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  deleteAllExams();
                }),
                icon: Icon(Icons.clear)),
            IconButton(
                onPressed: (() => showDialog(
                    context: context,
                    builder: ((BuildContext context) =>
                        const Authetication()))),
                icon: Icon(Icons.person))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: const [
                HiveRazredFilters(),
                HiveExamsByRazred(),
                AddNewExamFloatingActionButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
