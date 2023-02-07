import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';
import 'package:hive/hive.dart';

//firebase android!!!!

final db = FirebaseFirestore.instance;
final ispiti = db.collection("ispiti");
final users = db.collection("users");
// možda redovno pozivati ovu funkciju ako korisnik ostane logiran tako da
// svaki put kad npr. gasi ili upali app, prvo napravi sinkronizaciju

// razmisliti o svim slučajevima korištenja funkcije sync exams
// - što ako se korisnik prijavljuje u svoj račun na novom mobitelu, što ako se prijavljuje na tuđem
// -
Future syncExams(String userId, Box hiveBox) async {
  //prvo upload lokalnih na firebase
  final local = hiveBox.values;

  for (Exam exam in local) {
    final documentName =
        "${exam.naziv.toString().replaceAll(" ", "")}${exam.razred}";

    users.doc(userId).collection("ispiti").doc(documentName).set(exam.toJson());
  }
  // zatim download firebase u lokalnu bazu ako ne postoje
  // download trenutno uspoređuje ispite prema nazivu, a trebalo bi ih na neki drugi način
  // usporediti. Trenutno pravopisnu provjeru u 8. i 5. razredu doživljava kao isti ispit
  // i neće ga skinuti
  final cloud = users
      .doc(userId)
      .collection("ispiti")
      .get()
      .then((value) => value.docs.map((e) => Exam.fromJson(e.data())).toList());

  cloud.then(
    (listOfFirestoreExams) {
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
    },
  );
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
