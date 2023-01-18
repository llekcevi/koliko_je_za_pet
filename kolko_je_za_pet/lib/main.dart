import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'firebase_options.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'screens/home_page.dart';

//razmisliti o loading screenu? Možda i ne treba jer je circual progress ok i razumljiv
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ExamAdapter());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
    child: MaterialApp(
      home: FutureBuilder(
        future: Hive.openBox("exams"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Scaffold();
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ),
  ));
}
