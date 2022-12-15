import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kolko_je_za_pet/provider.dart';

class Authetication extends ConsumerWidget {
  const Authetication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final google = ref.read(googleSignInProvider);
    final user = google.user;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.displayName!),
          ElevatedButton(
            child: Text("google login"),
            onPressed: () => google.googleLogin(),
          ),
        ],
      ),
    );
  }
}
