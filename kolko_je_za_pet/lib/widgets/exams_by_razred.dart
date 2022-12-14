import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/database_functions.dart';
import 'package:kolko_je_za_pet/widgets/all_exams_list.dart';
import 'package:kolko_je_za_pet/provider.dart';

class ExamsByRazred extends ConsumerWidget {
  const ExamsByRazred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final razred = ref.watch(razredFilterProvider);

    return Expanded(
      child: FutureBuilder(
        future: sortByRazred(razred),
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
      ),
    );
  }
}
