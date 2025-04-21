import 'package:flutter/material.dart';
import 'package:topinaja/models/category.dart';
import 'package:topinaja/widgets/home/category_item_widget.dart';
import 'package:topinaja/config/locale_keys.dart'; // Untuk data dummy

class CategoryGridWidget extends StatelessWidget {
  // Data kategori bisa didapatkan dari API atau state management
  // Untuk contoh, kita buat data dummy di sini
  final List<Category> categories = const [
    Category(
        nameLocaleKey: LocaleKeys.categoryElectronic,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryFood,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryAccessories,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryBeauty,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryFurniture,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryFashion,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryHealth,
        iconPath: 'assets/icons/category_placeholder.svg'),
    Category(
        nameLocaleKey: LocaleKeys.categoryStationery,
        iconPath: 'assets/icons/category_placeholder.svg'),
  ];

  const CategoryGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Agar GridView menyesuaikan tingginya
      physics:
          const NeverScrollableScrollPhysics(), // Nonaktifkan scroll internal
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 kolom sesuai desain
        crossAxisSpacing: 12.0, // Jarak horizontal
        mainAxisSpacing: 12.0, // Jarak vertikal
        childAspectRatio: 0.8, // Sesuaikan rasio aspek item
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItemWidget(
          category: categories[index],
          onTap: () {
            // TODO: Implementasi navigasi ke halaman kategori
            print('Tapped on: ${categories[index].nameLocaleKey}');
          },
        );
      },
    );
  }
}
