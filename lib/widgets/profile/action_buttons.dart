import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onLogout;

  const ActionButtons({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onLogout,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('Keluar'),
        ),
      ],
    );
  }
}
