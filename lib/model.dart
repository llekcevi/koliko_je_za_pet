import 'package:hive/hive.dart';

part 'model.g.dart';

// ako bi se radile funkcije kojima korisnik može uređivati bodovni rang,
// trebalo bi napraviti još polja za upis graničnih bodova

@HiveType(typeId: 0)
class Exam {
  @HiveField(0)
  String? naziv;
  @HiveField(1)
  int? ukupanBrojBodova;
  @HiveField(2)
  int? razred;

  Exam({this.ukupanBrojBodova, this.razred, this.naziv});

  List<List<int>> getGrades(int totalPoints) {
    int halfPoint = totalPoints % 2 == 0
        ? (totalPoints / 2).round() + 1
        : (totalPoints / 2).round();

    List<int> positiveGrade =
        List.generate(halfPoint, (index) => totalPoints - index);

    List<int> betterGrades =
        positiveGrade.sublist(0, (halfPoint / 2).round() - (halfPoint % 2));
    List<int> worseGrades = positiveGrade.sublist(
        (halfPoint / 2).round() - (halfPoint % 2), halfPoint);

    List<int> points5 = betterGrades.sublist(
        0, ((betterGrades.length / 2).round() - betterGrades.length % 2));

    List<int> points4 = betterGrades.sublist(
        (betterGrades.length / 2).round() - (betterGrades.length % 2),
        betterGrades.length);

    List<int> points3 =
        worseGrades.sublist(0, (worseGrades.length / 2).round());

    List<int> points2 = worseGrades.sublist(
        (worseGrades.length / 2).round(), worseGrades.length);

    List<int> points1 = List.generate((totalPoints / 2).round() - 1,
        (index) => ((totalPoints / 2).round() - 1) - index);

    return [points5, points4, points3, points2, points1];
  }

  Map<String, dynamic> toJson() {
    return {
      "naziv": naziv,
      "ukupanBrojBodova": ukupanBrojBodova,
      "razred": razred
    };
  }

  static Exam fromJson(Map<String, dynamic> json) => Exam(
      naziv: json["naziv"],
      ukupanBrojBodova: json["ukupanBrojBodova"],
      razred: json["razred"]);

  @override
  String toString() {
    return "Naziv: $naziv | Ukupan broj bodova: $ukupanBrojBodova | Razred: $razred.";
  }
}
