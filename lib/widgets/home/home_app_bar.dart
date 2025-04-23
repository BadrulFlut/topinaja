import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:topinaja/config/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Ganti dengan warna AppBar dari tema jika sudah diatur
    final appBarColor =
        theme.appBarTheme.backgroundColor ?? theme.colorScheme.primary;
    final iconColor = theme.appBarTheme.foregroundColor ?? Colors.white;

    return AppBar(
      elevation: 0, // Sesuai desain
      backgroundColor: appBarColor,
      leadingWidth: 40, // Beri sedikit ruang untuk logo
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0), // Sesuaikan padding
        // child: SvgPicture.asset(
        //   'assets/icons/placeholder.svg', // Ganti dengan path logo SVG Anda
        //   colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        //   semanticsLabel: 'App Logo',
        // ),
      ),
      title: Text(
        LocaleKeys.appTitle.tr(), // Gunakan judul dari lokalisasi
        style: theme.appBarTheme.titleTextStyle?.copyWith(color: iconColor) ??
            TextStyle(
                color: iconColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          tooltip: 'Notifications', // TODO: Lokalisasi
          icon: Icon(
            PhosphorIcons.bell(PhosphorIconsStyle.fill),
            color: iconColor,
          ),
          // SvgPicture.asset(
          //   'assets/icons/notification.svg', // Ganti dengan path ikon notifikasi
          //   colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          //   semanticsLabel: 'Notifications',
          // ),
          onPressed: () {
            // TODO: Implementasi aksi notifikasi
          },
        ),
        IconButton(
          tooltip: 'Cart', // TODO: Lokalisasi
          icon: Icon(
            PhosphorIcons.shoppingCart(PhosphorIconsStyle.fill),
            color: iconColor,
          ),
          // icon: SvgPicture.asset(
          //   'assets/icons/cart.svg', // Ganti dengan path ikon keranjang
          //   colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          //   semanticsLabel: 'Cart',
          // ),
          onPressed: () {
            // TODO: Implementasi aksi keranjang
          },
        ),
        const SizedBox(width: 8), // Sedikit jarak di kanan
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
