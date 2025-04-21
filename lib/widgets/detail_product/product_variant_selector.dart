import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductVariantSelector extends StatefulWidget {
  // TODO: Terima daftar opsi warna dan kapasitas
  final List<String> colors = ['Space Gray', 'White'];
  final List<String> capacities = ['Wi-fi', 'Wi-fi + Cellular'];

  ProductVariantSelector({super.key});

  @override
  State<ProductVariantSelector> createState() => _ProductVariantSelectorState();
}

class _ProductVariantSelectorState extends State<ProductVariantSelector> {
  String? _selectedColor;
  String? _selectedCapacity;

  @override
  void initState() {
    super.initState();
    // Set pilihan default jika ada
    _selectedColor = widget.colors.isNotEmpty ? widget.colors[0] : null;
    _selectedCapacity =
        widget.capacities.isNotEmpty ? widget.capacities[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Type', // TODO: Lokalisasi
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // Pilihan Warna
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Colors : ${_selectedColor ?? '-'}', // TODO: Lokalisasi
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: widget.colors.map((color) {
                        // TODO: Ganti dengan representasi warna asli jika ada
                        Color displayColor;
                        if (color.toLowerCase() == 'space gray') {
                          displayColor = Colors.grey.shade800;
                        } else if (color.toLowerCase() == 'white') {
                          displayColor = Colors.white;
                        } else {
                          displayColor = Colors.transparent; // Fallback
                        }
                        bool isSelected = _selectedColor == color;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = color;
                            });
                            // TODO: Callback perubahan
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: displayColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? theme.colorScheme.primary
                                    : (color.toLowerCase() == 'white'
                                        ? Colors.grey.shade300
                                        : Colors.transparent),
                                width: isSelected ? 2.0 : 1.0,
                              ),
                              boxShadow: color.toLowerCase() == 'white'
                                  ? [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 1)
                                    ]
                                  : null,
                            ),
                            child: isSelected
                                ? Icon(
                                    PhosphorIcons.check(
                                        PhosphorIconsStyle.bold),
                                    color: theme.colorScheme.primary,
                                    size: 16)
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Pilihan Kapasitas
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Capacity : ${_selectedCapacity ?? '-'}', // TODO: Lokalisasi
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: widget.capacities.map((capacity) {
                        bool isSelected = _selectedCapacity == capacity;
                        return ChoiceChip(
                          label: Text(capacity),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedCapacity = capacity;
                            });
                            // TODO: Callback perubahan
                          },
                          selectedColor:
                              theme.colorScheme.primary.withOpacity(0.1),
                          labelStyle: TextStyle(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.textTheme.bodyMedium?.color,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: isSelected
                                      ? theme.colorScheme.primary
                                      : Colors.grey.shade300,
                                  width: 1)),
                          backgroundColor: Colors.transparent,
                          showCheckmark: false,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
