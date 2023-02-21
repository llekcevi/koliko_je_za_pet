import 'package:flutter/material.dart';

class NazivTextField extends StatelessWidget {
  const NazivTextField({
    Key? key,
    required this.nazivController,
  }) : super(key: key);

  final TextEditingController nazivController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Naziv ispita: ",
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            autocorrect: false,
            controller: nazivController,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
