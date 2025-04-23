import 'package:flutter/material.dart';
// Jika ada teks yang perlu dilokalkan

class HomeBannerWidget extends StatelessWidget {
  // URL gambar banner akan dinamis
  final String imageUrl;
  final VoidCallback? onShopNow;

  const HomeBannerWidget({
    super.key,
    this.imageUrl =
        'https://via.placeholder.com/600x250/cccccc/969696?text=Banner+Placeholder', // URL Placeholder
    this.onShopNow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(12.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: Alignment.centerLeft, // Ratakan konten teks ke kiri
          children: [
            // Gambar Banner
            Image.network(
              imageUrl,
              height: 150, // Sesuaikan tinggi banner
              width: double.infinity,
              fit: BoxFit.cover,
              // Loading dan error builder untuk pengalaman pengguna yang lebih baik
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Colors.grey[300],
                child: const Center(
                    child: Icon(Icons.error_outline, color: Colors.grey)),
              ),
            ),

            // Overlay gelap untuk kontras teks (opsional)
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.1),
                  ],
                  stops: const [0.0, 0.7], // Sesuaikan gradient stop
                ),
              ),
            ),

            // Konten Teks dan Tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Agar column tidak memenuhi stack
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "6.6 Flash Sale", // TODO: Buat dinamis/lokalkan jika perlu
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Cashback Up to 100%", // TODO: Buat dinamis/lokalkan jika perlu
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: onShopNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange, // Warna tombol sesuai desain
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Shop Now"), // TODO: Lokalisasi
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
