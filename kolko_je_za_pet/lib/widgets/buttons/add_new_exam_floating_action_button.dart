import 'package:flutter/material.dart';
import '../input_points_alert_dialog.dart';

class AddNewExamFloatingActionButton extends StatelessWidget {
  const AddNewExamFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Dodaj novi ispit"),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const InputPoints()));
  }
}
