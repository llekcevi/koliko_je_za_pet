import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RazredTextField extends StatelessWidget {
  const RazredTextField({
    Key? key,
    required this.razredController,
  }) : super(key: key);

  final TextEditingController razredController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Razred: ",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 50,
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            controller: razredController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                counter: SizedBox.shrink()),
          ),
        )
      ],
    );
  }
}
