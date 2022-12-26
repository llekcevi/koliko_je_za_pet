import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kolko_je_za_pet/firestore_functions.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:kolko_je_za_pet/provider.dart';

class RazredTabs extends ConsumerWidget {
  const RazredTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var future = readExamsUser(ref.read(googleSignInProvider).user.id);
    final selectedRazred = ref.watch(razredFilterProvider);
    final razredProvider = ref.read(razredFilterProvider.notifier);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FutureBuilder<List<Exam>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("something went wrong");
          } else if (snapshot.hasData) {
            final exams = snapshot.data!;
            List razredi = [];
            for (int exam = 0; exam < exams.length; exam++) {
              !razredi.contains(exams[exam].razred)
                  ? razredi.add(exams[exam].razred)
                  : null;
            }
            if (razredi.isNotEmpty && razredi.length > 1) {
              return ListView.builder(
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
              );
            } else {
              return Container();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  RoundedRectangleBorder listTileBorderRadius() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)));
  }
}

class HiveRazredFilters extends ConsumerWidget {
  const HiveRazredFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final selectedRazred = ref.watch(razredFilterProvider);
    final razredProvider = ref.read(razredFilterProvider.notifier);

    List razredi = [];
    for (int exam = 0; exam < examsBox.length; exam++) {
      final exams = examsBox.getAt(exam);

      !razredi.contains(exams.razred) ? razredi.add(exams.razred) : null;
    }

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

  RoundedRectangleBorder listTileBorderRadius() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)));
  }
}
