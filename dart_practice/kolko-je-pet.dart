import 'dart:io';

void main() {
  print("Koliko bodova ima ispit?");

  String? brojBodova = stdin.readLineSync();

  var nBrojBodova = int.parse(brojBodova!);
  var polovica = nBrojBodova % 2 == 0
      ? (nBrojBodova / 2).round() + 1
      : (nBrojBodova / 2).round();

  var lista = List.generate((polovica), (index) => nBrojBodova - index);

  print(lista);

  var prvaPolovica = lista.sublist(0, (polovica / 2).round() - (polovica % 2));
  var drugaPolovica =
      lista.sublist((polovica / 2).round() - (polovica % 2), polovica);

  print(prvaPolovica);
  print(drugaPolovica);

  var pet = prvaPolovica.sublist(
      0, (prvaPolovica.length / 2).round() - (prvaPolovica.length % 2));
  print(pet);
  var cetiri = prvaPolovica.sublist(
      (prvaPolovica.length / 2).round() - (prvaPolovica.length % 2),
      prvaPolovica.length);
  print(cetiri);

  var tri = drugaPolovica.sublist(0, (drugaPolovica.length / 2).round());
  print(tri);
  var dva = drugaPolovica.sublist(
      (drugaPolovica.length / 2).round(), drugaPolovica.length);
  print(dva);
}
