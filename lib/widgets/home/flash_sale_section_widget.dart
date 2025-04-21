import 'package:flutter/material.dart';
import 'package:topinaja/config/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:topinaja/config/routes.dart';
// import 'package:topinaja/widgets/home/flash_sale_item_widget.dart'; // Hapus impor ini
import 'package:topinaja/widgets/common/product_card_widget.dart'; // Impor ProductCardWidget
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlashSaleSectionWidget extends StatelessWidget {
  // Data produk flash sale akan dinamis (dari API/state)
  // final List<Product> flashSaleProducts;
  final Duration countdownDuration; // Durasi countdown

  const FlashSaleSectionWidget({
    super.key,
    // required this.flashSaleProducts,
    this.countdownDuration =
        const Duration(hours: 12, minutes: 56, seconds: 32), // Contoh durasi
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Format durasi menjadi HH:MM:SS (contoh sederhana)
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(countdownDuration.inHours.remainder(24));
    final minutes = twoDigits(countdownDuration.inMinutes.remainder(60));
    final seconds = twoDigits(countdownDuration.inSeconds.remainder(60));
    final countdownText = "$hours:$minutes:$seconds";

    // Contoh data produk dummy
    final List<Map<String, String?>> dummyProducts = [
      {
        'name': 'Ipad Pro 6th lhgfhg tfy fh ut f uyfuyf uhgjgjg y yguguygjhg',
        'discount': '6% off',
        'img': 'https://via.placeholder.com/300x400'
      },
      {
        'name': 'Macbook Air M2 (2022) 13',
        'discount': '10% off',
        'img': 'https://via.placeholder.com/400x300'
      },
      {
        'name': 'Uniqlo Basic T-shirt Oversized White',
        'discount': null,
        'img': 'https://via.placeholder.com/350x350'
      },
      {
        'name': 'New Balance 550 Men\'s Sneakers Shoes - Beige',
        'discount': '15% off',
        'img': 'https://via.placeholder.com/320x420'
      },
      {
        'name': 'Apple Watch Ultra 2 with Alpine Loop',
        'discount': '7% off',
        'img': 'https://via.placeholder.com/380x380'
      },
      {
        'name': 'Simple Black Trousers',
        'discount': null,
        'img': 'https://via.placeholder.com/280x450'
      },
    ];

    // Perkiraan tinggi item = 120 (gambar) + 8 (padding) + (14 * 2) (2 baris teks) + 8 (padding bawah) = ~164
    // Perkiraan lebar item = 150 (ditetapkan di FlashSaleItemWidget, tapi akan di-override oleh Grid)
    // Lebar layar / 2 - spacing
    // Untuk childAspectRatio, kita bisa mulai dengan (lebar per item) / (tinggi per item)
    // Asumsikan lebar layar ~360. Lebar per item ~ (360 - 16*2 - 12) / 2 = ~158
    // childAspectRatio ~ 158 / 190 (tinggi FlashSaleItemWidget yg diinginkan) ~ 0.83
    // Atau kita bisa tentukan tinggi item, dan biarkan lebar menyesuaikan.
    // Mari kita gunakan pendekatan tinggi tetap dan biarkan GridView menghitung rasio
    const double itemHeight = 190; // Sesuaikan jika perlu

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Seksi (Judul, Countdown, See All)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.baseline, // Ratakan baseline
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    LocaleKeys.flashSale.tr(),
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    LocaleKeys.endsIn.tr(),
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 4),
                  // Countdown Timer Placeholder (ganti dengan widget timer sebenarnya)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      countdownText,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1, // Beri sedikit spasi antar angka
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigasi ke halaman semua flash sale
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: Text(
                  LocaleKeys.seeAll.tr(),
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Daftar Produk Flash Sale (Staggered Grid View)
          StaggeredGrid.count(
            crossAxisCount: 2, // Tetap 2 kolom
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: List.generate(dummyProducts.length, (index) {
              final dummyProduct = dummyProducts[index];
              // Gunakan ProductCardWidget, hanya isi data relevan
              return ProductCardWidget(
                imageUrl: dummyProduct['img'] ??
                    'https://via.placeholder.com/300x400',
                productName: dummyProduct['name'] ?? 'Product Name',
                discountText: dummyProduct['discount'],
                price:
                    0, // Beri nilai default wajib (tidak akan tampil jika tidak ada detail lain)
                rating: 0, // Beri nilai default wajib
                soldCount: 0, // Beri nilai default wajib
                location: '', // Beri nilai default wajib
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.detailProduct);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
