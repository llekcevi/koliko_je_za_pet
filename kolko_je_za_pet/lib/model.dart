class Exam {
  String? label;
  late int totalPoints;
  String? classNumber;

  Exam({required this.totalPoints, this.classNumber, this.label});

  getGrades(int totalPoints) {
    int halfPoints = (totalPoints / 2).round();

    List positiveGrade =
        List.generate(halfPoints, (index) => totalPoints - index);

    List betterGrades = positiveGrade.sublist(0, (halfPoints / 2).round());
    List worseGrades =
        positiveGrade.sublist((halfPoints / 2).round(), halfPoints);

    List points5 = betterGrades.sublist(
        0, ((betterGrades.length / 2).round() - betterGrades.length % 2));

    List points4 = betterGrades.sublist(
        (betterGrades.length / 2).round() - (betterGrades.length % 2),
        betterGrades.length);
    ;

    List points3 = worseGrades.sublist(0, (worseGrades.length / 2).round());

    List points2 = worseGrades.sublist(
        (worseGrades.length / 2).round(), worseGrades.length);

    return [points5, points4, points3, points2];
  }

  @override
  String toString() {
    return totalPoints.toString();
  }
}
