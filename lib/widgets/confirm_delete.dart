import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/provider.dart';

class ConfirmDelete extends ConsumerWidget {
  final Exam examToDelete;

  const ConfirmDelete({super.key, required this.examToDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Jeste li sigurni da želite obrisati ispit?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text("Naziv ispita: ${examToDelete.naziv!}"),
            Text("Razred: ${examToDelete.razred.toString()}."),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                        style:
                            TextStyle(color: Color.fromARGB(180, 244, 67, 54)),
                        "Odustani")),
                TextButton(
                    onPressed: () {
                      deleteExam(examToDelete);
                      ref.read(examListChangeProvider.notifier).rebuild();
                      Navigator.pop(context);
                    },
                    child: const Text("Obriši")),
              ],
            )
          ],
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      );
    }
  }
}
