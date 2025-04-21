import 'package:flutter/material.dart';
import 'package:topinaja/widgets/common/discount_badge_widget.dart';
import 'package:intl/intl.dart'; // Untuk format harga

class ProductCardWidget extends StatelessWidget {
  // Data Produk (akan dinamis)
  final String imageUrl;
  final String productName;
  final double price;
  final double? originalPrice; // Harga asli jika ada diskon
  final double rating;
  final int soldCount;
  final String location;
  final String? discountText;
  final VoidCallback? onTap;

  const ProductCardWidget({
    super.key,
    this.imageUrl =
        'https://via.placeholder.com/300x400/cccccc/969696?text=Product',
    required this.productName,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.soldCount,
    required this.location,
    this.discountText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius =
        BorderRadius.circular(8.0); // Border radius lebih kecil
    // Formatter harga (contoh untuk IDR)
    final priceFormat = NumberFormat.currency(
        locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Gambar dan Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7.0),
                    topRight: Radius.circular(7.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          color: Colors.grey[200],
                          child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2)),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Colors.grey[200],
                        child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                if (discountText != null && discountText!.isNotEmpty)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: DiscountBadgeWidget(discountText: discountText!),
                  ),
              ],
            ),
            // Detail Produk
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nama Produk
                  Text(
                    productName,
                    style: theme.textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Harga (Tampilkan hanya jika > 0)
                  if (price > 0)
                    Text(
                      priceFormat.format(price),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  // Harga Asli (jika ada diskon)
                  if (originalPrice != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        priceFormat.format(originalPrice),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.grey[600],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  // Jarak sebelum rating/lokasi (tampilkan hanya jika detail ada)
                  if (price > 0 || rating > 0 || location.isNotEmpty)
                    const SizedBox(height: 6),
                  // Rating dan Terjual (Tampilkan hanya jika rating > 0)
                  if (rating > 0)
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[600], size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                        if (soldCount > 0) ...[
                          const SizedBox(width: 4),
                          Text('|',
                              style: theme.textTheme.labelSmall
                                  ?.copyWith(color: Colors.grey[400])),
                          const SizedBox(width: 4),
                          Text(
                            '$soldCount sold', // TODO: Lokalisasi "sold"
                            style: theme.textTheme.labelSmall
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                        ],
                      ],
                    ),
                  // Jarak sebelum lokasi (tampilkan hanya jika rating & lokasi ada)
                  if (rating > 0 && location.isNotEmpty)
                    const SizedBox(height: 4),
                  // Lokasi Toko (Tampilkan hanya jika tidak kosong)
                  if (location.isNotEmpty)
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.grey[600], size: 14),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
