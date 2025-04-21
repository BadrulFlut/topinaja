import 'package:flutter/material.dart';
// import 'package:topinaja/main.dart'; // Hapus impor ini
import 'package:topinaja/screens/main_screen.dart'; // Impor MainScreen
import 'package:topinaja/pages/settings_page.dart'; // Impor halaman settings
import 'package:topinaja/screens/search_screen.dart'; // Impor SearchScreen
import 'package:topinaja/pages/profile_page.dart'; // Impor halaman profile
import 'package:topinaja/pages/detail_product_page.dart'; // Impor halaman detail produk
// Impor halaman lain jika ada

class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings'; // Rute baru
  static const String search = '/search'; // Rute baru untuk search
  static const String profile = '/profile'; // Rute baru untuk profile
  static const String detailProduct =
      '/detail-product'; // Rute baru untuk detail produk
  // static const String detailPage = '/detail'; // Contoh rute lain

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        // Rute home sekarang ke MainScreen
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case settings: // Tambahkan case untuk settings
        return MaterialPageRoute(builder: (_) => SettingsPage()); // Hapus const
      case search: // Tambahkan case untuk search
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case profile: // Tambahkan case untuk profile
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case detailProduct: // Tambahkan case untuk detail produk
        return MaterialPageRoute(builder: (_) => const DetailProductPage());
      // case detailPage:
      //   final args = settings.arguments as Map<String, dynamic>; // Contoh mengambil argumen
      //   return MaterialPageRoute(builder: (_) => DetailPage(data: args['data']));
      default:
        // Halaman jika rute tidak ditemukan
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found: ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
