import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Impor PhosphorIcons
import 'package:topinaja/config/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:topinaja/config/routes.dart'; // Impor AppRoutes

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Tentukan warna berdasarkan tema (misalnya, sedikit lebih gelap/terang dari background)
    final fillColor = theme.brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[200];
    final iconColor = theme.colorScheme.onSurfaceVariant;
    final hintStyle =
        theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[600]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            // Bungkus dengan InkWell untuk menangani ketukan
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.search);
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0), // Padding internal
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
                      color: iconColor,
                      size: 22, // Sesuaikan ukuran
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LocaleKeys.searchHint.tr(),
                      style: hintStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12), // Jarak antara search bar dan filter
          IconButton(
            icon: Icon(
              PhosphorIcons.funnel(PhosphorIconsStyle.fill),
              color: theme.colorScheme.primary,
            ),
            // icon: SvgPicture.asset(
            //   'assets/icons/filter.svg', // Path ikon filter
            //   width: 24,
            //   height: 24,
            //   colorFilter:
            //       ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
            //   semanticsLabel: 'Filter', // TODO: Lokalisasi
            // ),
            tooltip: 'Filter', // TODO: Lokalisasi
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primaryContainer
                  .withOpacity(0.2), // Background lembut
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(12), // Sesuaikan padding
            ),
            onPressed: () {
              // TODO: Implementasi aksi filter
            },
          ),
        ],
      ),
    );
  }
}
