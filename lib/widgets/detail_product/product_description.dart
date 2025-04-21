import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  // TODO: Terima deskripsi produk
  final String description =
      "iPad Pro 6th Generation offers high performance with an Apple "
      "M2 chip, Liquid Retina Designed to be slim and light, this tablet "
      "supports 5G networks...";

  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;
  // Tentukan jumlah baris maksimum saat tidak diperluas
  final int _maxLinesCollapsed = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Tentukan apakah teks melebihi batas baris
    final textSpan =
        TextSpan(text: widget.description, style: theme.textTheme.bodyMedium);
    final textPainter = TextPainter(
        text: textSpan,
        maxLines: _maxLinesCollapsed,
        textDirection: TextDirection.ltr);
    textPainter.layout(
        maxWidth:
            MediaQuery.of(context).size.width - 32); // 16 padding on each side
    final bool isTextOverflowing = textPainter.didExceedMaxLines;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description Product',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          AnimatedCrossFade(
            firstChild: Text(
              widget.description,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              maxLines: _maxLinesCollapsed,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Text(
              widget.description,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          // Tampilkan tombol "Read more"/"Read less" hanya jika teks meluap
          if (isTextOverflowing)
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0), // Beri sedikit jarak
                child: Text(
                  _isExpanded ? ' Read less' : ' Read more',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
