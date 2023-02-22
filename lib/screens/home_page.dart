import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/widgets/exams_by_razred.dart';
import 'package:kolko_je_za_pet/widgets/buttons/add_new_exam_floating_action_button.dart';

import '../widgets/razred_filters.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Koliko je za pet?"),
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
