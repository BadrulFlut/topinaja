import 'package:flutter/material.dart';
import 'package:topinaja/widgets/search/popular_search_item_widget.dart';

class PopularSearchGridWidget extends StatelessWidget {
  // Data pencarian populer akan dinamis
  // final List<PopularSearchData> popularSearches;

  const PopularSearchGridWidget({
    super.key,
    // required this.popularSearches,
  });

  @override
  Widget build(BuildContext context) {
    // Contoh data dummy
    final List<Map<String, String>> dummySearches = [
      {'term': 'Fossil Watch', 'img': 'https://via.placeholder.com/100x50/1'},
      {'term': 'Iphone 14 Pro', 'img': 'https://via.placeholder.com/100x50/2'},
      {'term': 'Gaming Chair', 'img': 'https://via.placeholder.com/100x50/3'},
      {'term': 'New Balance', 'img': 'https://via.placeholder.com/100x50/4'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummySearches.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        childAspectRatio:
            3.0, // Sesuaikan rasio aspek agar item tidak terlalu tinggi
        // Atau gunakan mainAxisExtent jika lebih mudah:
        // mainAxisExtent: 60, // Tentukan tinggi pasti item popular search
      ),
      itemBuilder: (context, index) {
        // final searchData = popularSearches[index];
        final dummySearch = dummySearches[index];
        return PopularSearchItemWidget(
          // imageUrl: searchData.imageUrl,
          imageUrl: dummySearch['img']!,
          searchTerm: dummySearch['term']!,
          onTap: () {
            // TODO: Implementasi aksi ketika item pencarian populer diklik
            print('Tapped popular search: ${dummySearch['term']}');
          },
        );
      },
    );
  }
}
