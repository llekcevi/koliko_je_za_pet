import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/style.dart';

class HiveRazredFilters extends ConsumerWidget {
  const HiveRazredFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final selectedRazred = ref.watch(razredFilterProvider);
    final razredProvider = ref.read(razredFilterProvider.notifier);

    List<dynamic> razredi = getUniqueRazred(examsBox);

    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: razredi.length,
          itemBuilder: (context, index) => SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: ListTile(
              shape: listTileBorderRadius(),
              selected: selectedRazred == razredi[index] ? true : false,
              tileColor: Theme.of(context).highlightColor,
              selectedTileColor: Colors.white,
              onTap: () {
                razredProvider.chooseRazredFilter(razredi[index]);
              },
              title: Text(
                textAlign: TextAlign.center,
                razredi[index].toString(),
              ),
            ),
          ),
        ));
  }

  List<dynamic> getUniqueRazred(Box<dynamic> examsBox) {
    List razredi = [];
    for (int exam = 0; exam < examsBox.length; exam++) {
      final exams = examsBox.getAt(exam);

      !razredi.contains(exams.razred) ? razredi.add(exams.razred) : null;
    }
    razredi.sort();
    return razredi;
  }
}
