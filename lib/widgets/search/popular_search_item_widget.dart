import 'package:flutter/material.dart';

class PopularSearchItemWidget extends StatelessWidget {
  final String imageUrl;
  final String searchTerm;
  final VoidCallback? onTap;

  const PopularSearchItemWidget({
    super.key,
    this.imageUrl =
        'https://via.placeholder.com/100x50/cccccc/969696?text=Item', // Placeholder
    required this.searchTerm,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(8.0);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7.0),
                bottomLeft: Radius.circular(7.0),
              ),
              child: Image.network(
                imageUrl,
                width: 50, // Lebar gambar tetap
                height: double.infinity, // Tinggi mengikuti container Row
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 50,
                    color: Colors.grey[200],
                    child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 50,
                  color: Colors.grey[200],
                  child: const Center(
                      child:
                          Icon(Icons.image_not_supported, color: Colors.grey)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                searchTerm,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
