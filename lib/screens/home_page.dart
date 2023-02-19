import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'package:kolko_je_za_pet/widgets/exams_by_razred.dart';
import 'package:kolko_je_za_pet/widgets/buttons/add_new_exam_floating_action_button.dart';

import '../widgets/razred_filters.dart';

//sync funkcija bi trebala odmah osvježiti homepage

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//extract custom appBar widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Koliko je za pet? offline"),
          actions: [
            IconButton(
                onPressed: (() {
                  deleteAllExams();
                }),
                icon: Icon(Icons.clear)),
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
