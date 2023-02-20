import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Providers for input fields
//--------------------------
final nazivProvider = Provider((ref) => TextEditingController());

final razredProvider = Provider((ref) => TextEditingController());

final bodoviProvider = Provider((ref) => TextEditingController());

void clearTextEditingProviders(
    TextEditingController nazivController,
    TextEditingController razredController,
    TextEditingController bodoviController) {
  nazivController.clear();
  razredController.clear();
  bodoviController.clear();
}
//--------------------------

//Providers for filter menu
//-------------------------
class RazredFilterState extends StateNotifier<int> {
  RazredFilterState() : super(0);
  void chooseRazredFilter(int razred) => state = razred;
  int get getRazredFilter => state;
}

final razredFilterProvider =
    StateNotifierProvider<RazredFilterState, int>((ref) => RazredFilterState());
//-------------------------

// Provider for changes in exam list
class ExamListChange extends StateNotifier<int> {
  ExamListChange() : super(0);
  void rebuild() => state += 1;
}

final examListChangeProvider =
    StateNotifierProvider<ExamListChange, int>((ref) => ExamListChange());
//----------------------------------