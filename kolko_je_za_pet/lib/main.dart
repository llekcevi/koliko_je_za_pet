import 'dart:io';

void main() {
  print("Koliko bodova ima ispit?");

  String? brojBodova = stdin.readLineSync();

  var nBrojBodova = int.parse(brojBodova!);

  var polovica = nBrojBodova / 2;

  var interval = polovica / 4;

  print(interval);
}
