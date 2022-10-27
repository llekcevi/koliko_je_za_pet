import 'package:flutter/material.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: InputPoints(),
        ),
      ),
    );
  }
}

class InputPoints extends StatelessWidget {
  const InputPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Exam exam;

    return Container(
      width: 100,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onSubmitted: ((value) {
          (exam = Exam(totalPoints: int.parse(value)));
          print(exam.getGrades(int.parse(value)));
        }),
      ),
    );
  }
}
