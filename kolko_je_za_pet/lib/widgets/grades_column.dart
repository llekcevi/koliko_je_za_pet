import 'package:flutter/material.dart';
import 'package:kolko_je_za_pet/model.dart';

class GradesColumn extends StatelessWidget {
  const GradesColumn({
    Key? key,
    required this.exam,
  }) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final points = exam.ukupanBrojBodova;
    final grades = exam.getGrades(points!);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ukupan broj bodova: ${grades[0].first}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text("Odličan: ${grades[0].first} - ${grades[0].last}"),
        Text("Vrlo dobar: ${grades[1].first} - ${grades[1].last}"),
        Text("Dobar: ${grades[2].first} - ${grades[2].last}"),
        Text("Dovoljan: ${grades[3].first} - ${grades[3].last}"),
        Text("Nedovoljan: ${grades[4].first} - ${grades[4].last}"),
      ],
    );
  }
}
