import 'package:flutter/material.dart';

class GradesColumn extends StatelessWidget {
  const GradesColumn({
    Key? key,
    required this.points,
  }) : super(key: key);

  final List<List<int>> points;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ukupan broj bodova: ${points[0].first}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text("Odličan: ${points[0].first} - ${points[0].last}"),
        Text("Vrlo dobar: ${points[1].first} - ${points[1].last}"),
        Text("Dobar: ${points[2].first} - ${points[2].last}"),
        Text("Dovoljan: ${points[3].first} - ${points[3].last}"),
        Text("Nedovoljan: ${points[4].first} - ${points[4].last}"),
      ],
    );
  }
}
