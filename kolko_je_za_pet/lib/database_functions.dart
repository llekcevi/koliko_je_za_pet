import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

final db = FirebaseFirestore.instance;
final ispiti = db.collection("ispiti");

Future getAllExams() async {
  await ispiti.get().then((event) {
    for (var doc in event.docs) {
      return doc.data();
    }
  });
}

Future writeExam(Exam exam) async {
  final documentName =
      "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

  ispiti.doc(documentName).set(exam.examToJson());
}
