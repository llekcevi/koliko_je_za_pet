import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'package:kolko_je_za_pet/widgets/exams_by_razred.dart';
import 'package:kolko_je_za_pet/widgets/hive/all_hive_exams.dart';
import 'package:kolko_je_za_pet/widgets/razred_tabs.dart';
import 'package:kolko_je_za_pet/widgets/buttons/add_new_exam_floating_action_button.dart';
import 'package:kolko_je_za_pet/auth/authetication.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  deleteAllExams();
                  print(Hive.box("exams"));
                }),
                icon: Icon(Icons.clear)),
            IconButton(
                onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Authetication())))),
                icon: Icon(Icons.person))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: const [
                //RazredTabs(),
                //ExamsByRazred(),
                HiveRazredFilters(),
                Expanded(child: HiveExamsByRazred()),
                AddNewExamFloatingActionButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
