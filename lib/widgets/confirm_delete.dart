import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'package:kolko_je_za_pet/model.dart';

class ConfirmDelete extends StatelessWidget {
  final Exam examToDelete;

  const ConfirmDelete({super.key, required this.examToDelete});

  @override
  Widget build(BuildContext context) {
    {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Jeste li sigurni da želite obrisati ispit?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
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
                      Navigator.pop(context);
                    },
                    child: Text("Obriši")),
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
