import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:topinaja/widgets/profile/profile_option_tile.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionTile(
          icon: PhosphorIcons.info(PhosphorIconsStyle.fill),
          title: 'Tentang Aplikasi',
          onTap: () {
            // TODO: Navigate to about page
          },
        ),
        ProfileOptionTile(
          icon: PhosphorIcons.question(PhosphorIconsStyle.fill),
          title: 'Bantuan & FAQ',
          onTap: () {
            // TODO: Navigate to help page
          },
        ),
      ],
    );
  }
}
