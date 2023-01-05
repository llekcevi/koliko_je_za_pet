import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kolko_je_za_pet/hive_functions.dart';
import 'model.dart';
import 'package:hive/hive.dart';

final db = FirebaseFirestore.instance;
final ispiti = db.collection("ispiti");
final users = db.collection("users");

Future syncExams(String userId, Box hiveBox) async {
  final local = hiveBox.values;

  for (Exam exam in local) {
    final documentName =
        "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

    users.doc(userId).collection("ispiti").doc(documentName).set(exam.toJson());
  }

  final cloud = users
      .doc(userId)
      .collection("ispiti")
      .get()
      .then((value) => value.docs.map((e) => Exam.fromJson(e.data())).toList());

  cloud.then((listOfFirestoreExams) {
    for (Exam firestoreExam in listOfFirestoreExams) {
      final hiveList = hiveBox.values.toList();
      final duplicateExams = hiveList
          .where((hiveExam) => hiveExam.naziv == firestoreExam.naziv)
          .toList();
      if (duplicateExams.isEmpty) {
        hiveBox.add(firestoreExam);
        print("added ${firestoreExam.toString()}");
      } else {
        print("not added");
      }
    }

    //print(hiveBox.values.toList());
  });
}

Future writeExamUser(Exam exam, String userID) async {
  final usersExams = users.doc(userID).collection("ispiti");

  final documentName =
      "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

  usersExams.doc(documentName).set(exam.toJson());
}

Future writeExam(Exam exam) async {
  final documentName =
      "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

  ispiti.doc(documentName).set(exam.toJson());
}

Future<List<Exam>> readExams() =>
    ispiti.orderBy("razred", descending: false).get().then((snapshot) =>
        snapshot.docs.map((doc) => Exam.fromJson(doc.data())).toList());

Future<List<Exam>> readExamsUser(String userId) => users
    .doc(userId)
    .collection("ispiti")
    .orderBy("razred", descending: false)
    .get()
    .then((snapshot) =>
        snapshot.docs.map((doc) => Exam.fromJson(doc.data())).toList());

Future<List<Exam>> sortByRazred(int razred) => ispiti
    .where("razred", isEqualTo: razred)
    .get()
    .then((value) => value.docs.map((e) => Exam.fromJson(e.data())).toList());

Future<List<Exam>> sortByRazredUser(int razred, String userId) => users
    .doc(userId)
    .collection("ispiti")
    .where("razred", isEqualTo: razred)
    .get()
    .then((value) => value.docs.map((e) => Exam.fromJson(e.data())).toList());
