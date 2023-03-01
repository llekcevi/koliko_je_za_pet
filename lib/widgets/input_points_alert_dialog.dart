import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/provider.dart';
import 'package:kolko_je_za_pet/widgets/text_fields/input_points_text_field.dart';
import 'package:kolko_je_za_pet/widgets/buttons/cancel_alert_dialog_text_button.dart';

import 'buttons/continue_saving_exam_text_button.dart';

class InputPoints extends ConsumerWidget {
  const InputPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodoviController = ref.read(bodoviProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text("Broj bodova"),
      contentPadding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      content: InputPointsTextField(bodoviController: bodoviController),
      actions: [
        CancelAlertDialogTextButton(bodoviController: bodoviController),
        ContinueSavingExamTextButton(bodoviController: bodoviController),
      ],
    );
  }
}
