import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topinaja/providers/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topinaja/widgets/profile/profile_header.dart';
import 'package:topinaja/widgets/profile/profile_section_title.dart';
import 'package:topinaja/widgets/profile/settings_section.dart';
import 'package:topinaja/widgets/profile/app_section.dart';
import 'package:topinaja/widgets/profile/action_buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoggedIn = false;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (mounted && loggedIn != _isLoggedIn) {
      setState(() {
        _isLoggedIn = loggedIn;
      });
    }
  }

  Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dengarkan perubahan SettingsProvider
    final settingsProvider = Provider.of<SettingsProvider>(context);
    _isDarkMode = settingsProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Profile header
            ProfileHeader(isLoggedIn: _isLoggedIn),
            const SizedBox(height: 24),

            // Settings section
            const ProfileSectionTitle(title: 'Pengaturan'),
            SettingsSection(
              settingsProvider: settingsProvider,
              isLoggedIn: _isLoggedIn,
              isDarkMode: _isDarkMode,
            ),

            const SizedBox(height: 24),

            // App section
            const ProfileSectionTitle(title: 'Aplikasi'),
            const AppSection(),

            const SizedBox(height: 32),

            // Action buttons for logged in users
            if (_isLoggedIn) ActionButtons(onLogout: _handleLogout),
          ],
        ),
      ),
    );
  }
}
