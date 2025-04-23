import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Impor PhosphorIcons
import 'package:topinaja/providers/settings_provider.dart';
import 'package:topinaja/widgets/profile/profile_option_tile.dart';
import 'package:topinaja/widgets/profile/theme_mode_dialog.dart'; // Akan dibuat nanti

class SettingsSection extends StatelessWidget {
  final SettingsProvider settingsProvider;
  final bool isLoggedIn;
  final bool isDarkMode;

  const SettingsSection({
    super.key,
    required this.settingsProvider,
    required this.isLoggedIn,
    required this.isDarkMode,
  });

  String _getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Ikuti pengaturan sistem';
      case ThemeMode.light:
        return 'Mode terang';
      case ThemeMode.dark:
        return 'Mode gelap';
    }
  }

  void _showThemeModeDialog(BuildContext context, SettingsProvider provider) {
    showDialog(
      context: context,
      builder: (context) => ThemeModeDialog(settingsProvider: provider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile details option (only for logged in users)
        if (isLoggedIn)
          ProfileOptionTile(
            icon: PhosphorIcons.user(PhosphorIconsStyle.fill),
            title: 'Detail Profil',
            onTap: () {
              // TODO: Navigate to profile details
            },
          ),

        // Text scaling option
        ProfileOptionTile(
          icon: PhosphorIcons.textT(PhosphorIconsStyle.fill),
          title: 'Pengaturan Skala Teks',
          subtitle: 'Ubah ukuran teks untuk kenyamanan membaca',
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),

        // Theme mode option
        ProfileOptionTile(
          icon: isDarkMode
              ? PhosphorIcons.moon(PhosphorIconsStyle.fill)
              : PhosphorIcons.sun(PhosphorIconsStyle.fill),
          title: 'Mode Tema',
          subtitle: _getThemeModeText(settingsProvider.themeMode),
          onTap: () => _showThemeModeDialog(context, settingsProvider),
        ),
      ],
    );
  }
}
