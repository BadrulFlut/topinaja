import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WishlistItemShimmer extends StatelessWidget {
  const WishlistItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shimmerBaseColor = theme.brightness == Brightness.dark
        ? Colors.grey[700]!
        : Colors.grey[300]!;
    final shimmerHighlightColor = theme.brightness == Brightness.dark
        ? Colors.grey[600]!
        : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar Placeholder
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white, // Warna solid untuk area shimmer
                ),
              ),
            ),
            // Info Placeholder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategori
                        Container(width: 50, height: 10, color: Colors.white),
                        const SizedBox(height: 8),
                        // Nama Produk
                        Container(
                            width: double.infinity,
                            height: 14,
                            color: Colors.white),
                        const SizedBox(height: 6),
                        // Lokasi
                        Container(width: 100, height: 10, color: Colors.white),
                      ]),
                  // Harga & Tombol Placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 80, height: 12, color: Colors.white),
                      Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(8.0))), // Tombol
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
