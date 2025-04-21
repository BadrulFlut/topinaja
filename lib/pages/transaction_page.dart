import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:topinaja/widgets/transaction/transaction_item_widget.dart';
import 'package:topinaja/widgets/transaction/transaction_search_filter_bar.dart';
import 'package:topinaja/widgets/transaction/transaction_item_shimmer.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool _isLoading = true;

  // TODO: Ganti dengan data transaksi asli dan logika pengambilan data
  final List<Map<String, dynamic>> _allTransactions = List.generate(
    25, // Tambah data dummy
    (index) => {
      'id': 'trx$index',
      'merchantName': [
        'Intelligentsia Coffee',
        'Uber',
        'Far Media Inc.',
        'Airbnb',
        'Netflix',
        'Big Papa Grocery',
        'Shell Gas Station'
      ][index % 7],
      'category': [
        'Restaurants & cafes',
        'Transport',
        'Paychecks',
        'Hotels & rent',
        'Media & telecom',
        'Food & groceries',
        'Transport'
      ][index % 7],
      'amount': [
            -10.95,
            -20.47,
            200.00,
            -258.65,
            -39.99,
            -15.38,
            -103.75
          ][index % 7] *
          (1 + index * 0.05),
      'date': DateTime.now().subtract(Duration(days: index, hours: index * 3)),
      'categoryIcon': [
        PhosphorIcons.coffee,
        PhosphorIcons.car,
        PhosphorIcons.creditCard,
        PhosphorIcons.house,
        PhosphorIcons.monitorPlay,
        PhosphorIcons.shoppingCartSimple,
        PhosphorIcons.gasPump
      ][index % 7](PhosphorIconsStyle.regular),
    },
  )..sort((a, b) => b['date'].compareTo(a['date'])); // Urutkan dari terbaru

  List<Map<String, dynamic>> _filteredTransactions = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadTransactionData();
  }

  Future<void> _loadTransactionData() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _isLoading = false;
        _applyFilters();
      });
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredTransactions = _allTransactions.where((trx) {
        final nameMatch = trx['merchantName']
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
        // TODO: Tambahkan logika filter tanggal dan kategori
        return nameMatch;
      }).toList();
    });
    if (!_isLoading) {
      setState(() {});
    }
  }

  void _onSearchChanged(String query) {
    _searchQuery = query;
    _applyFilters();
    setState(() {});
  }

  void _onFilterTap() {
    // TODO: Implementasi logika buka modal/halaman filter
    print('Filter tapped');
  }

  void _onDateRangeTap() {
    // TODO: Implementasi logika buka pemilih rentang tanggal
    print('Date range tapped');
  }

  // Helper untuk mengelompokkan transaksi berdasarkan tanggal
  Map<String, List<Map<String, dynamic>>> _groupTransactionsByDate(
      List<Map<String, dynamic>> transactions) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (var trx in transactions) {
      final date = trx['date'] as DateTime;
      final dateKey = DateTime(date.year, date.month, date.day);
      String groupTitle;

      if (dateKey == today) {
        groupTitle = 'Today';
      } else if (dateKey == yesterday) {
        groupTitle = 'Yesterday';
      } else {
        groupTitle = DateFormat('EEEE, MMMM d, yyyy').format(dateKey);
      }

      if (grouped[groupTitle] == null) {
        grouped[groupTitle] = [];
      }
      grouped[groupTitle]!.add(trx);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TransactionSearchFilterBar(
            onSearchChanged: _onSearchChanged,
            onFilterTap: _onFilterTap,
            onDateRangeTap: _onDateRangeTap,
          ),
          Expanded(
            child: _isLoading
                ? _buildShimmerList(context)
                : _filteredTransactions.isEmpty
                    ? _buildEmptyState(context)
                    : _buildTransactionListView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: 8,
      itemBuilder: (context, index) => const TransactionItemShimmer(),
      separatorBuilder: (context, index) =>
          const Divider(height: 1, thickness: 0.5, indent: 52, endIndent: 16),
    );
  }

  Widget _buildTransactionListView(BuildContext context) {
    final groupedTransactions = _groupTransactionsByDate(_filteredTransactions);
    final groupKeys = groupedTransactions.keys.toList();

    return ListView.builder(
      itemCount: groupKeys.length,
      itemBuilder: (context, index) {
        final groupTitle = groupKeys[index];
        final transactionsInGroup = groupedTransactions[groupTitle]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                groupTitle,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.grey[600], fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactionsInGroup.length,
              itemBuilder: (context, itemIndex) {
                final trx = transactionsInGroup[itemIndex];
                return TransactionItemWidget(
                  date: trx['date'],
                  merchantName: trx['merchantName'],
                  category: trx['category'],
                  amount: trx['amount'],
                  categoryIcon: trx['categoryIcon'],
                  onTap: () {
                    print('Tapped transaction: ${trx['id']}');
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                  height: 1, thickness: 0.5, indent: 72, endIndent: 16),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Ganti dengan gambar/ilustrasi yang sesuai
            Icon(
              PhosphorIcons.ladder(PhosphorIconsStyle.light), // Contoh ikon
              size: 100,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              'No transactions found', // TODO: Lokalisasi
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Please change the date, your filters or try different keywords', // TODO: Lokalisasi
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _onFilterTap, // Arahkan ke fungsi filter
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
              child: const Text('Change Filters'), // TODO: Lokalisasi
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: Implementasi clear all filters
                _searchQuery = ''; // Reset search
                // Reset filter tanggal & kategori lainnya
                _applyFilters();
                print('Clear all filters tapped');
              },
              child: const Text('Clear all filters'), // TODO: Lokalisasi
            ),
          ],
        ),
      ),
    );
  }
}
