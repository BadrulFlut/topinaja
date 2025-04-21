import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:topinaja/widgets/common/product_card_widget.dart';

class RecommendationGridWidget extends StatelessWidget {
  // Data rekomendasi produk akan dinamis
  // final List<Product> recommendedProducts;

  const RecommendationGridWidget({
    super.key,
    // required this.recommendedProducts,
  });

  @override
  Widget build(BuildContext context) {
    // Contoh data dummy
    final List<Map<String, dynamic>> dummyProducts = [
      {
        'name': 'Uniqlo Basic T-shirt Oversized White',
        'price': 200000.0,
        'rating': 4.9,
        'sold': 518,
        'location': 'Surabaya',
        'img': 'https://via.placeholder.com/350x350/aaa'
      },
      {
        'name': 'New Balance 550 Men\'s Sneakers Shoes - Beige',
        'price': 1792650.0,
        'originalPrice': 2109000.0,
        'discount': '15% off',
        'rating': 4.9,
        'sold': 814,
        'location': 'Malang',
        'img': 'https://via.placeholder.com/320x420/bbb'
      },
      {
        'name': 'Apple Watch Ultra 2 with Alpine Loop',
        'price': 12500000.0,
        'discount': '7% off',
        'rating': 4.8,
        'sold': 205,
        'location': 'Jakarta',
        'img': 'https://via.placeholder.com/380x380/ccc'
      },
      {
        'name': 'Nike Dri-FIT Academy Woven Tracksuit Men\'s',
        'price': 750000.0,
        'rating': 4.7,
        'sold': 1023,
        'location': 'Bandung',
        'img': 'https://via.placeholder.com/280x450/ddd'
      },
      // Tambahkan lebih banyak produk dummy jika perlu
    ];

    return StaggeredGrid.count(
      crossAxisCount: 2, // 2 kolom
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      // Kita tidak perlu physics atau shrinkWrap karena sudah dalam ListView
      children: List.generate(dummyProducts.length, (index) {
        final dummyProduct = dummyProducts[index];
        return ProductCardWidget(
          imageUrl:
              dummyProduct['img'] ?? 'https://via.placeholder.com/300x400',
          productName: dummyProduct['name'] ?? 'Product Name',
          price: dummyProduct['price'] ?? 0.0,
          originalPrice: dummyProduct['originalPrice'], // Bisa null
          discountText: dummyProduct['discount'], // Bisa null
          rating: dummyProduct['rating'] ?? 0.0,
          soldCount: dummyProduct['sold'] ?? 0,
          location: dummyProduct['location'] ?? 'Unknown',
          onTap: () {
            // TODO: Implementasi navigasi ke detail produk
            print('Tapped recommendation: ${dummyProduct['name']}');
          },
        );
      }),
    );
  }
}
