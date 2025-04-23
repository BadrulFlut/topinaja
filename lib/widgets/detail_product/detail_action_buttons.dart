import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DetailActionButtons extends StatelessWidget {
  const DetailActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme
            .scaffoldBackgroundColor, // Warna background sama dengan scaffold
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // Shadow ke atas
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: Icon(
                  PhosphorIcons.shoppingCartSimple(PhosphorIconsStyle.fill)),
              label: const Text('Add to Cart'), // TODO: Lokalisasi
              onPressed: () {
                // TODO: Implement add to cart logic
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
                side: BorderSide(color: theme.colorScheme.primary),
                padding: const EdgeInsets.symmetric(
                    vertical: 14), // Sesuaikan padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement checkout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme
                    .colorScheme.primary, // Warna primer untuk tombol utama
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                    vertical: 14), // Sesuaikan padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2, // Sedikit elevasi
              ),
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
