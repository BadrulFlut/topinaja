import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topinaja/providers/settings_provider.dart';

class ThemeModeDialog extends StatelessWidget {
  final SettingsProvider settingsProvider;

  const ThemeModeDialog({super.key, required this.settingsProvider});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pilih Mode Tema'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildThemeModeOption(context, ThemeMode.system,
              'Ikuti pengaturan sistem', settingsProvider),
          _buildThemeModeOption(
              context, ThemeMode.light, 'Mode terang', settingsProvider),
          _buildThemeModeOption(
              context, ThemeMode.dark, 'Mode gelap', settingsProvider),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
      ],
    );
  }

  Widget _buildThemeModeOption(BuildContext context, ThemeMode mode,
      String title, SettingsProvider provider) {
    return RadioListTile<ThemeMode>(
      title: Text(title),
      value: mode,
      groupValue: provider.themeMode,
      onChanged: (ThemeMode? value) {
        if (value != null) {
          provider.updateThemeMode(value);
          // Tidak perlu setState di sini karena provider akan memberitahu ProfilePage
          Navigator.pop(context);
        }
      },
    );
  }
}
