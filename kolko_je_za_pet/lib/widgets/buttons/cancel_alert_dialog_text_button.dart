import 'package:flutter/material.dart';

class CancelAlertDialogTextButton extends StatelessWidget {
  const CancelAlertDialogTextButton({
    Key? key,
    required this.bodoviController,
  }) : super(key: key);

  final TextEditingController bodoviController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (() {
          bodoviController.clear();
          Navigator.pop(context);
        }),
        child: const Text(
            style: TextStyle(color: Color.fromARGB(180, 244, 67, 54)),
            "Odustani"));
  }
}
