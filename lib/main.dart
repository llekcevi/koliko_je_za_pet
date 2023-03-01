import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ExamAdapter());

  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Hive.openBox("exams"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ),
  ));
}
