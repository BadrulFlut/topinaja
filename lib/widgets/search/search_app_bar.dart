import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:topinaja/config/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final VoidCallback? onFilterPressed;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

  const SearchAppBar({
    super.key,
    required this.controller,
    this.onFilterPressed,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = theme.brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[200];
    final iconColor = theme.colorScheme.onSurfaceVariant;

    return AppBar(
      // Hilangkan background default dan elevation jika perlu
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      // Gunakan back button default atau kustom
      leading: IconButton(
        icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.regular),
            color: theme.colorScheme.onSurface),
        onPressed: () => Navigator.pop(context),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      ),
      titleSpacing: 0, // Hapus spacing default title
      title: TextField(
        controller: controller,
        autofocus: true, // Fokus otomatis saat layar terbuka
        decoration: InputDecoration(
          hintText: LocaleKeys.searchHint.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
                PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
                color: iconColor,
                size: 22),
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
      actions: [
        IconButton(
          icon: Icon(PhosphorIcons.funnel(PhosphorIconsStyle.fill),
              color: theme.colorScheme.primary),
          tooltip: 'Filter', // TODO: Lokalisasi
          style: IconButton.styleFrom(
            backgroundColor:
                theme.colorScheme.primaryContainer.withOpacity(0.2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            padding: const EdgeInsets.all(12),
          ),
          onPressed: onFilterPressed,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
