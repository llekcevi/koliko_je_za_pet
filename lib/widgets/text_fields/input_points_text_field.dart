import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPointsTextField extends StatelessWidget {
  const InputPointsTextField({
    Key? key,
    required this.bodoviController,
  }) : super(key: key);

  final TextEditingController bodoviController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: bodoviController,
    );
  }
}
