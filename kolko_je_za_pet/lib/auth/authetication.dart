import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/firestore_functions.dart';

// urediti i razmisliti o dizajnu - možda samo kao neki drawer ili neki drugi
// widget manji od cijelog novog zaslona.

// prikazati ime i prezime ako je login

// urediti hasError slučaj

// preseliti u simple dialog

class Authetication extends ConsumerWidget {
  const Authetication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsBox = Hive.box("exams");
    final google = ref.read(googleSignInProvider);
    final userStateChange = FirebaseAuth.instance.authStateChanges();
    return AlertDialog(
      content: StreamBuilder(
        stream: userStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(google.currentUser!.displayName!),
                  Divider(),
                  ElevatedButton(
                      onPressed: (() {
                        final id = google.currentUser!.uid;
                        syncExams(id, examsBox);
                      }),
                      child: Text("sinkroniziraj")),
                  ElevatedButton(
                      child: Text("google logout"),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      }),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      child: Text("google login"),
                      onPressed: () {
                        google.googleLogin();
                      }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
