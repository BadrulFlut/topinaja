import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailProductPageShimmer extends StatelessWidget {
  const DetailProductPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shimmerBaseColor = theme.brightness == Brightness.dark
        ? Colors.grey[700]!
        : Colors.grey[300]!;
    final shimmerHighlightColor = theme.brightness == Brightness.dark
        ? Colors.grey[600]!
        : Colors.grey[100]!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: shimmerHighlightColor,
        child: ListView(
            // Gunakan ListView agar mirip dengan layout asli
            physics:
                const NeverScrollableScrollPhysics(), // Disable scroll di shimmer
            children: [
              // Image Viewer Shimmer
              Column(
                children: [
                  Container(
                    height: screenWidth * 0.8,
                    width: double.infinity,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            )),
                  )
                ],
              ),
              const SizedBox(height: 16),
              // Product Info Shimmer
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // Nama dan tombol favorit
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(height: 18, color: Colors.white)),
                        const SizedBox(width: 16),
                        Container(width: 24, height: 24, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                        width: 120, height: 16, color: Colors.white), // Harga
                    const SizedBox(height: 6),
                    Container(
                        width: 80,
                        height: 12,
                        color: Colors.white), // Harga coret (opsional)
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
              // Description Shimmer
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 150,
                        height: 16,
                        color: Colors.white), // Judul deskripsi
                    const SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white),
                    const SizedBox(height: 6),
                    Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white),
                    const SizedBox(height: 6),
                    Container(
                        width: 100,
                        height: 12,
                        color: Colors.white), // Baris terakhir deskripsi
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
              // Variant Shimmer
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 80,
                            height: 16,
                            color: Colors.white), // Judul Type
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // Warna
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 60,
                                      height: 12,
                                      color: Colors.white), // Label warna
                                  const SizedBox(height: 8),
                                  Row(
                                      children: List.generate(
                                          2,
                                          (i) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: const CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.white),
                                              )))
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Kapasitas
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 80,
                                      height: 12,
                                      color: Colors.white), // Label kapasitas
                                  const SizedBox(height: 8),
                                  Row(
                                      children: List.generate(
                                          2,
                                          (i) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                    width: 50,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                              )))
                                ],
                              ),
                            ),
                          ],
                        )
                      ]))
            ]));
  }
}
