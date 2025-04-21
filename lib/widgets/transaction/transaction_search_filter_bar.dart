import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionSearchFilterBar extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onFilterTap;
  final VoidCallback onDateRangeTap;

  const TransactionSearchFilterBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterTap,
    required this.onDateRangeTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          SizedBox(
            height: 45, // Sesuaikan tinggi search bar
            child: TextField(
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search transactions', // TODO: Lokalisasi
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                prefixIcon: Icon(
                  PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
                  color: Colors.grey[500],
                  size: 20,
                ),
                filled: true,
                fillColor: theme.brightness == Brightness.dark
                    ? Colors.grey[850]
                    : Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                border: textFieldBorder,
                enabledBorder: textFieldBorder,
                focusedBorder: textFieldBorder.copyWith(
                  borderSide:
                      BorderSide(color: theme.colorScheme.primary, width: 1.5),
                ),
              ),
              style: const TextStyle(fontSize: 14), // Sesuaikan font size input
            ),
          ),
          const SizedBox(height: 12),
          // Filter Buttons
          Row(
            children: [
              // Filter Button
              OutlinedButton.icon(
                onPressed: onFilterTap,
                icon: Icon(PhosphorIcons.funnel(PhosphorIconsStyle.regular),
                    size: 18),
                label: const Text(
                    'Filters'), // TODO: Tambahkan jumlah filter jika aktif (e.g., 'Filters 3')
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  textStyle: const TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(width: 8),
              // Date Range Button
              OutlinedButton.icon(
                onPressed: onDateRangeTap,
                icon: Icon(
                    PhosphorIcons.calendarBlank(PhosphorIconsStyle.regular),
                    size: 18),
                label: const Text(
                    'Date Range'), // TODO: Tampilkan range tanggal terpilih
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  textStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
