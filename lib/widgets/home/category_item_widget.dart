import 'package:flutter/material.dart';
import 'package:topinaja/models/category.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryItemWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap, // Tambahkan aksi jika diperlukan
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30, // Sesuaikan ukuran lingkaran
            backgroundColor: theme.colorScheme.primaryContainer
                .withOpacity(0.1), // Warna background lembut
            child: Icon(
              Icons.home,
              color: theme.colorScheme.primary,
            ),
            // child: SvgPicture.asset(
            //   category.iconPath,
            //   width: 32, // Sesuaikan ukuran ikon
            //   height: 32,
            //   // Tidak perlu colorFilter jika ikon sudah berwarna
            //   semanticsLabel:
            //       category.nameLocaleKey.tr(), // Label aksesibilitas
            // ),
          ),
          const SizedBox(height: 8),
          Text(
            category.nameLocaleKey.tr(),
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2, // Antisipasi nama panjang
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
