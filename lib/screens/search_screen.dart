import 'package:flutter/material.dart';
import 'package:topinaja/widgets/search/search_app_bar.dart';
import 'package:topinaja/widgets/search/popular_search_grid_widget.dart';
import 'package:topinaja/widgets/search/recommendation_grid_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    print('Performing search for: $query');
    // TODO: Implementasi logika pencarian (menampilkan hasil, dll.)
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Tambahkan kunci lokalisasi untuk judul seksi

    return Scaffold(
      // Gunakan SearchAppBar
      appBar: SearchAppBar(
        controller: _searchController,
        onSubmitted: _performSearch,
        onChanged: (value) {
          // Bisa tambahkan logika auto-suggest di sini
        },
        onFilterPressed: () {
          // TODO: Implementasi aksi filter
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            "Popular Search", // TODO: Lokalisasi
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          // Gunakan PopularSearchGridWidget
          const PopularSearchGridWidget(),
          const SizedBox(height: 24),
          Text(
            "Recommend for You", // TODO: Lokalisasi
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          // Gunakan RecommendationGridWidget
          const RecommendationGridWidget(),
        ],
      ),
    );
  }
}
