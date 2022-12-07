import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nazivProvider = Provider((ref) => TextEditingController());

final razredProvider = Provider((ref) => TextEditingController());

final bodoviProvider = Provider((ref) => TextEditingController());

void clearProviders(
    TextEditingController nazivController,
    TextEditingController razredController,
    TextEditingController bodoviController) {
  nazivController.clear();
  razredController.clear();
  bodoviController.clear();
}
