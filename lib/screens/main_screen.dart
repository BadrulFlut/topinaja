import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Impor PhosphorIcons
import 'package:easy_localization/easy_localization.dart';
import 'package:topinaja/config/locale_keys.dart';
import 'package:topinaja/pages/home_page.dart';
import 'package:topinaja/pages/wishlist_page.dart';
import 'package:topinaja/pages/transaction_page.dart';
import 'package:topinaja/pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Daftar halaman untuk setiap tab
  final List<Widget> _pages = [
    const HomePage(),
    const WishlistPage(),
    const TransactionPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: Tambahkan kunci lokalisasi untuk label bottom nav bar

    return Scaffold(
      body: IndexedStack(
        // Gunakan IndexedStack agar state halaman terjaga
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Agar semua label terlihat
        selectedItemColor: theme.colorScheme.primary, // Warna item aktif
        unselectedItemColor: Colors.grey, // Warna item tidak aktif
        showUnselectedLabels: true,
        selectedFontSize: 12, // Sesuaikan ukuran font jika perlu
        unselectedFontSize: 12,
        items: [
          _buildNavItem(
              context, 'assets/icons/home.svg', LocaleKeys.navHome, 0),
          _buildNavItem(
              context, 'assets/icons/wishlist.svg', LocaleKeys.navWishlist, 1),
          _buildNavItem(context, 'assets/icons/transaction.svg',
              LocaleKeys.navTransaction, 2),
          _buildNavItem(
              context, 'assets/icons/profile.svg', LocaleKeys.navProfile, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      BuildContext context, String iconPath, String localeKey, int index) {
    final theme = Theme.of(context);
    final bool isActive = _currentIndex == index;

    // Menentukan ikon sesuai dengan tab
    IconData iconData;
    switch (index) {
      case 0:
        iconData = PhosphorIcons.house(PhosphorIconsStyle.fill);
        break;
      case 1:
        iconData = PhosphorIcons.heart(PhosphorIconsStyle.fill);
        break;
      case 2:
        iconData = PhosphorIcons.receipt(PhosphorIconsStyle.fill);
        break;
      case 3:
        iconData = PhosphorIcons.user(PhosphorIconsStyle.fill);
        break;
      default:
        iconData = PhosphorIcons.house(PhosphorIconsStyle.fill);
    }

    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: isActive ? theme.colorScheme.primary : Colors.grey,
      ),
      // icon: SvgPicture.asset(
      //   iconPath,
      //   width: 24,
      //   height: 24,
      //   // Semantic label untuk aksesibilitas
      //   semanticsLabel: '$localeKey icon',
      //   colorFilter: ColorFilter.mode(
      //     isActive ? theme.colorScheme.primary : Colors.grey,
      //     BlendMode.srcIn,
      //   ),
      // ),
      label: localeKey.tr(), // Gunakan tr()
    );
  }
}
