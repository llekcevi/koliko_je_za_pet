import 'package:flutter_riverpod/flutter_riverpod.dart';

final examGradesProvider = StateProvider<List<List<int>>>((ref) {
  return [];
});

final examTotalPointsProvider = StateProvider<int>((ref) => 0);

final examLabelProvider = StateProvider<String>((ref) => "");

final examClassNumberProvider = StateProvider<int>((ref) => 0);
