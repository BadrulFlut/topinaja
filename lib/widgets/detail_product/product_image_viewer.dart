import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductImageViewer extends StatefulWidget {
  // TODO: Terima daftar URL gambar
  const ProductImageViewer({super.key});

  @override
  State<ProductImageViewer> createState() => _ProductImageViewerState();
}

class _ProductImageViewerState extends State<ProductImageViewer> {
  int _currentPage = 0;
  final int _imageCount = 3; // TODO: Dapatkan dari daftar gambar

  @override
  Widget build(BuildContext context) {
    // Tentukan tinggi berdasarkan lebar layar untuk rasio aspek tertentu
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.8; // Sesuaikan rasio jika perlu

    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: PageView.builder(
            itemCount: _imageCount,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              // TODO: Ganti dengan gambar produk aktual
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.grey[300],
                child: Center(
                    child: Icon(PhosphorIcons.image(PhosphorIconsStyle.fill),
                        size: 100, color: Colors.grey[600])),
                // child: Image.network(
                //   widget.imageUrls[index], // Gunakan URL gambar
                //   fit: BoxFit.contain, // Sesuaikan fit gambar
                // ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_imageCount, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Theme.of(context).colorScheme.primary // Warna aktif
                    : Colors.grey[400], // Warna tidak aktif
              ),
            );
          }),
        ),
        const SizedBox(
            height: 8), // Tambahkan sedikit jarak sebelum konten lain
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              '${_currentPage + 1}/$_imageCount',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey[600]),
            ),
          ),
        )
      ],
    );
  }
}
