import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/widgets/exams_by_razred.dart';
import 'package:kolko_je_za_pet/widgets/razred_tabs.dart';
import 'package:kolko_je_za_pet/widgets/buttons/add_new_exam_floating_action_button.dart';

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
              children: const [
                RazredTabs(),
                ExamsByRazred(),
                AddNewExamFloatingActionButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
