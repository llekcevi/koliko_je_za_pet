import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/screens/exams_list.dart';
import 'package:kolko_je_za_pet/provider.dart';

class FilterExams extends ConsumerWidget {
  const FilterExams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final razred = ref.watch(razredFilterProvider);

    return FutureBuilder(
        future: filterRazred(razred),
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
