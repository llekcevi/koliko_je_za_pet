import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/model.dart';

class HiveExamsByRazred extends ConsumerWidget {
  const HiveExamsByRazred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final razred = ref.watch(razredFilterProvider);
    final exams = examsBox.values.where((element) => element.razred == razred);

    return ListView.builder(
        itemCount: exams.length,
        itemBuilder: ((context, index) {
          Exam exam = exams.elementAt(index);
          return ListTile(
            title: Text(exam.naziv!),
          );
        }));
/* 
    for (Exam exam in exams) {
      return ListTile(
        title: Text(exam.naziv!),
        subtitle: Text(exam.razred.toString()),
      );
    }
    return Container(); */
  }
}

class HiveByRazred extends ConsumerWidget {
  HiveByRazred({super.key});

  final examsBox = Hive.box("exams");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final razred = ref.watch(razredFilterProvider);
    List exams = examsBox.values.toList();
    final filtered = exams.where((element) => element["razred"] == 6).toList();

    return ListView.builder(itemBuilder: ((context, index) {
      return Text("");
    }));
  }
}
