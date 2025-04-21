import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TransactionItemShimmer extends StatelessWidget {
  const TransactionItemShimmer({super.key});

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Ikon Placeholder
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 16),
            // Info Placeholder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 150, height: 14, color: Colors.white),
                  const SizedBox(height: 6),
                  Container(width: 100, height: 10, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Jumlah Placeholder
            Container(width: 70, height: 14, color: Colors.white),
            const SizedBox(width: 8),
            Container(width: 12, height: 12, color: Colors.white), // Panah
          ],
        ),
      ),
    );
  }
}
