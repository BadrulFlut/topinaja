import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Impor PhosphorIcons
import 'package:topinaja/widgets/detail_product/product_image_viewer.dart';
import 'package:topinaja/widgets/detail_product/product_info.dart';
import 'package:topinaja/widgets/detail_product/product_description.dart';
import 'package:topinaja/widgets/detail_product/product_variant_selector.dart';
import 'package:topinaja/widgets/detail_product/detail_action_buttons.dart';
import 'package:topinaja/widgets/detail_product/detail_product_page_shimmer.dart'; // Impor shimmer

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  bool _isLoading = true;
  // TODO: Tambahkan state untuk data produk asli nanti

  @override
  void initState() {
    super.initState();
    _loadProductData();
  }

  Future<void> _loadProductData() async {
    // Simulasi loading data produk
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.regular),
              color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(PhosphorIcons.shareNetwork(PhosphorIconsStyle.regular),
                color: Colors.black),
            onPressed: _isLoading
                ? null
                : () {/* TODO: Implement share functionality */},
          ),
        ],
      ),
      body: _isLoading
          ? const DetailProductPageShimmer() // Tampilkan shimmer saat loading
          : ListView(
              // Tampilkan konten asli setelah loading
              children: [
                const ProductImageViewer(), // TODO: Kirim data gambar asli
                const ProductInfo(), // TODO: Kirim data info asli
                const Divider(
                    height: 1, thickness: 1, indent: 16, endIndent: 16),
                const ProductDescription(), // TODO: Kirim deskripsi asli
                const Divider(
                    height: 1, thickness: 1, indent: 16, endIndent: 16),
                ProductVariantSelector(), // TODO: Kirim data varian asli
                const SizedBox(height: 80),
              ],
            ),
      bottomNavigationBar:
          const DetailActionButtons(), // Tetap tampilkan tombol aksi
    );
  }
}
