class Exam {
  String? label;
  late int totalPoints;
  String? classNumber;

  Exam({required this.totalPoints, this.classNumber, this.label});

  List getGrades(int totalPoints) {
    int halfPoint = totalPoints % 2 == 0
        ? (totalPoints / 2).round() + 1
        : (totalPoints / 2).round();

    List positiveGrade =
        List.generate(halfPoint, (index) => totalPoints - index);

    List betterGrades =
        positiveGrade.sublist(0, (halfPoint / 2).round() - (halfPoint % 2));
    List worseGrades = positiveGrade.sublist(
        (halfPoint / 2).round() - (halfPoint % 2), halfPoint);

    List points5 = betterGrades.sublist(
        0, ((betterGrades.length / 2).round() - betterGrades.length % 2));

    List points4 = betterGrades.sublist(
        (betterGrades.length / 2).round() - (betterGrades.length % 2),
        betterGrades.length);
    ;

    List points3 = worseGrades.sublist(0, (worseGrades.length / 2).round());

    List points2 = worseGrades.sublist(
        (worseGrades.length / 2).round(), worseGrades.length);

    List points1 = List.generate((totalPoints / 2).round() - 1,
        (index) => ((totalPoints / 2).round() - 1) - index);

    return [points5, points4, points3, points2, points1];
  }

  @override
  String toString() {
    return totalPoints.toString();
  }
}
