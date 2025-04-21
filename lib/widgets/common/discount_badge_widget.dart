import 'package:flutter/material.dart';

class DiscountBadgeWidget extends StatelessWidget {
  final String discountText; // Teks diskon (misal: "6% off")

  const DiscountBadgeWidget({super.key, required this.discountText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Warna spesifik sesuai desain, atau ambil dari tema
    final badgeColor = Colors.red[100];
    final textColor = Colors.red[800];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(6), // Sesuaikan radius
      ),
      child: Text(
        discountText,
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
