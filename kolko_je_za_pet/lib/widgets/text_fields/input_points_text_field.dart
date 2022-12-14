import 'package:flutter/material.dart';

class InputPointsTextField extends StatelessWidget {
  const InputPointsTextField({
    Key? key,
    required this.bodoviController,
  }) : super(key: key);

  final TextEditingController bodoviController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: bodoviController,
    );
  }
}
