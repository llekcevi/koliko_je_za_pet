import 'package:flutter/material.dart';

class RazredTextField extends StatelessWidget {
  const RazredTextField({
    Key? key,
    required this.razredController,
  }) : super(key: key);

  final TextEditingController razredController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Razred: "),
        TextField(
          controller: razredController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        )
      ],
    );
  }
}
