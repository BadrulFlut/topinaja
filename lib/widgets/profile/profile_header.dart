import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileHeader extends StatelessWidget {
  final bool isLoggedIn;

  const ProfileHeader({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isLoggedIn
                ? PhosphorIcons.user(PhosphorIconsStyle.fill)
                : PhosphorIcons.user(PhosphorIconsStyle.regular),
            size: 60,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          isLoggedIn ? 'Nama Pengguna' : 'Tamu',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          isLoggedIn ? 'Pengguna' : 'Silakan masuk untuk akses lengkap',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
        const SizedBox(height: 16),
        if (!isLoggedIn)
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to login page
            },
            child: const Text('Masuk'),
          ),
      ],
    );
  }
}
