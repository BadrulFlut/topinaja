import 'package:flutter/material.dart';
import 'package:topinaja/widgets/home/home_app_bar.dart';
import 'package:topinaja/widgets/home/search_bar_widget.dart';
import 'package:topinaja/widgets/home/delivery_info_widget.dart';
import 'package:topinaja/widgets/home/category_grid_widget.dart';
import 'package:topinaja/widgets/home/home_banner_widget.dart';
import 'package:topinaja/widgets/home/flash_sale_section_widget.dart';
import 'package:topinaja/widgets/home/category_shimmer.dart';
import 'package:topinaja/widgets/home/product_card_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Kelas ini sebelumnya adalah MyHomePage di main.dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Kelas ini sebelumnya adalah _MyHomePageState di main.dart
class _HomePageState extends State<HomePage> {
  bool _isLoading = true; // State loading

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  Future<void> _loadHomeData() async {
    // Simulasi loading data home
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Contoh alamat (nanti bisa dari state atau data user)
    const String dummyAddress =
        "Jl. Rose No. 123 Block A, Cipete Sub-District, Ci...";

    return Scaffold(
      // Gunakan HomeAppBar
      appBar: const HomeAppBar(),
      // Body akan diisi dengan komponen lain nanti
      body: _isLoading
          ? _buildShimmerBody(context)
          : _buildActualBody(context, dummyAddress),
      // Hapus FloatingActionButton jika tidak ada di desain Home
      // floatingActionButton: FloatingActionButton(...),
    );
  }

  // Widget untuk body saat loading (Shimmer)
  Widget _buildShimmerBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: [
        // Search Bar Shimmer (simple placeholder)
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: 50, // Sesuaikan tinggi SearchBarWidget
          decoration: BoxDecoration(
              color: Colors.white, // Warna solid untuk shimmer
              borderRadius: BorderRadius.circular(12.0)),
        ),
        // Delivery Info Shimmer
        Container(
            width: double.infinity,
            height: 14,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 8, bottom: 16)),
        // Category Shimmer
        const CategoryShimmer(),
        const SizedBox(height: 16),
        // Banner Shimmer
        AspectRatio(
            aspectRatio: 16 / 6, // Sesuaikan rasio banner
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)))),
        const SizedBox(height: 16),
        // Flash Sale / Product Grid Title Shimmer
        Container(
            width: 150,
            height: 16,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12)),
        // Product Grid Shimmer
        MasonryGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: 4, // Jumlah shimmer item produk
          itemBuilder: (context, index) => const ProductCardShimmer(),
        ),
      ],
    );
  }

  // Widget untuk body setelah data dimuat
  Widget _buildActualBody(BuildContext context, String dummyAddress) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: [
        const SearchBarWidget(),
        DeliveryInfoWidget(address: dummyAddress),
        const CategoryGridWidget(),
        HomeBannerWidget(
          onShopNow: () {/* TODO: Aksi shop now */},
        ),
        const FlashSaleSectionWidget(
            // TODO: Isi data asli
            ),
        const SizedBox(height: 16),
        // TODO: Tambahkan seksi produk lainnya dengan data asli
      ],
    );
  }
}
