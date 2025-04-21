import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionItemWidget extends StatelessWidget {
  final DateTime date;
  final String merchantName;
  final String category;
  final double amount; // Bisa positif (income) atau negatif (expense)
  final VoidCallback onTap;
  final IconData categoryIcon; // Ikon berdasarkan kategori

  const TransactionItemWidget({
    super.key,
    required this.date,
    required this.merchantName,
    required this.category,
    required this.amount,
    required this.onTap,
    required this.categoryIcon, // Tambahkan ikon
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeFormat = DateFormat('h:mm a'); // Format waktu (e.g., 8:24 pm)
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
        decimalDigits: 0); // Sesuaikan locale dan simbol

    final bool isIncome = amount > 0;
    final amountColor =
        isIncome ? Colors.green.shade600 : theme.textTheme.bodyLarge?.color;
    final amountString =
        (isIncome ? '+' : '') + formatCurrency.format(amount.abs());

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Ikon Kategori
            CircleAvatar(
              radius: 20,
              backgroundColor:
                  theme.colorScheme.primaryContainer.withOpacity(0.3),
              child: Icon(categoryIcon,
                  size: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 16),
            // Info Transaksi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    merchantName,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${timeFormat.format(date)} ⋅ $category',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Jumlah dan Panah
            Row(
              children: [
                Text(
                  amountString,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500, color: amountColor),
                ),
                const SizedBox(width: 8),
                Icon(
                  PhosphorIcons.caretRight(PhosphorIconsStyle.regular),
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
