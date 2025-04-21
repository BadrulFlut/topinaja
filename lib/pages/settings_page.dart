import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topinaja/providers/settings_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:topinaja/config/locale_keys.dart'; // Impor LocaleKeys
// Import LocaleKeys jika Anda ingin melokalkan judul dan deskripsi
// import 'package:topinaja/config/locale_keys.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  // Definisikan opsi skala teks (hapus const)
  final Map<double, String> scaleOptions = {
    0.9: "90%: Maximize Information display",
    1.0: "100%: Standard, optimal view (default)",
    1.1: "110%: Enhanced visibility and readability",
    1.2: "120%: Maximum enlargement for improved clarity",
  };

  @override
  Widget build(BuildContext context) {
    // Dapatkan provider
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // Gunakan key lokalisasi
        title: Text(LocaleKeys.settingsTitle.tr()),
      ),
      body: ListView(
        children: scaleOptions.entries.map((entry) {
          final double scaleValue = entry.key;
          final String description = entry.value;

          return RadioListTile<double>(
            title: Text(description),
            value: scaleValue,
            groupValue: settingsProvider.textScaleFactor,
            onChanged: (double? value) {
              if (value != null) {
                settingsProvider.updateTextScaleFactor(value);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
