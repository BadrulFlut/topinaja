import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:topinaja/widgets/wishlist/wishlist_item_widget.dart';
import 'package:topinaja/widgets/wishlist/wishlist_item_shimmer.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _wishlistItems = [];

  @override
  void initState() {
    super.initState();
    _loadWishlistData();
  }

  Future<void> _loadWishlistData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Map<String, dynamic>> items = List.generate(
      5,
      (index) => {
        'id': 'item$index',
        'name': [
          'Omah Manis',
          'Rinjani Villa',
          'Double Tree Villa',
          'Blue Sky Hotel',
          'Grand Aston'
        ][index % 5],
        'location': [
          'Bantul, Yogyakarta',
          'Sembalun, Lombok',
          'Batu, Malang',
          'Mandalika, Lombok Tengah',
          'Sudirman, Jakarta'
        ][index % 5],
        'category': 'HOTEL',
        'price': [215000.0, 500000.0, 375000.0, 284000.0, 1250000.0][index % 5],
        'imageUrl': null,
      },
    );

    if (mounted) {
      setState(() {
        _wishlistItems = items;
        _isLoading = false;
      });
    }
  }

  void _removeFromWishlist(String id) {
    setState(() {
      _wishlistItems.removeWhere((item) => item['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from wishlist')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.regular)),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
        ),
        title: const Text('Wishlist'),
        centerTitle: true,
        elevation: _isLoading ? 0 : 1,
        actions: [
          IconButton(
            icon:
                Icon(PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular)),
            onPressed: _isLoading ? null : () {/* TODO: Implementasi search */},
            tooltip: 'Search Wishlist',
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        itemCount: 5,
        itemBuilder: (context, index) => const WishlistItemShimmer(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
    }

    if (_wishlistItems.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      itemCount: _wishlistItems.length,
      itemBuilder: (context, index) {
        final item = _wishlistItems[index];
        return WishlistItemWidget(
          imageUrl: item['imageUrl'],
          productName: item['name'],
          category: item['category'],
          location: item['location'],
          price: item['price'],
          onRemove: () => _removeFromWishlist(item['id']),
          onBook: () {
            print('Book ${item['id']}');
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIcons.heartBreak(PhosphorIconsStyle.light),
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
