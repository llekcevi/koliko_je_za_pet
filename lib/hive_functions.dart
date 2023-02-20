import 'package:hive/hive.dart';
import 'model.dart';

void addExamToBox(Exam exam) {
  final examsBox = Hive.box("exams");

  examsBox.add(exam);
  print(exam);
}

void deleteAllExams() {
  final examsBox = Hive.box("exams");

  examsBox.clear();
}

void deleteExam(Exam exam) {
  final examsBox = Hive.box("exams");
  var key = exam.key;
  examsBox.delete(key);
}
