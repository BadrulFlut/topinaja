import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format mata uang
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductInfo extends StatelessWidget {
  // TODO: Terima data produk (nama, harga, harga asli, dll)
  final String productName = 'Ipad Pro 6th Generation 11 Inch 2022';
  final double currentPrice = 15299000;
  final double originalPrice = 16999000;
  final bool isFavorite = false; // TODO: Dapatkan status favorit

  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);
    final discountPercentage =
        ((originalPrice - currentPrice) / originalPrice * 100)
            .toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  productName,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite
                      ? PhosphorIcons.heart(PhosphorIconsStyle.fill)
                      : PhosphorIcons.heart(PhosphorIconsStyle.regular),
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // TODO: Implement favorite toggle logic
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                formatCurrency.format(currentPrice),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              if (discountPercentage != '0')
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$discountPercentage% off',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.red[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          if (discountPercentage != '0')
            Text(
              formatCurrency.format(originalPrice),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    );
  }
}
