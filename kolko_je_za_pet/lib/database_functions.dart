import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

final db = FirebaseFirestore.instance;
final ispiti = db.collection("ispiti");

Future writeExam(Exam exam) async {
  final documentName =
      "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

  ispiti.doc(documentName).set(exam.toJson());
}

Stream<List<Exam>> readExams() => ispiti.snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => Exam.fromJson(doc.data())).toList());
