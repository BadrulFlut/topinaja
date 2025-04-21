import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:topinaja/config/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class DeliveryInfoWidget extends StatelessWidget {
  final String address; // Alamat akan dinamis

  const DeliveryInfoWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locationColor = Colors.red; // Warna ikon lokasi sesuai desain

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // SvgPicture.asset(
          //   'assets/icons/location.svg', // Path ikon lokasi
          //   width: 18,
          //   height: 18,
          //   colorFilter: ColorFilter.mode(locationColor, BlendMode.srcIn),
          //   semanticsLabel: 'Location Pin',
          // ),
          Icon(
            Icons.location_on,
            color: locationColor,
          ),
          const SizedBox(width: 8),
          Text(
            '${LocaleKeys.deliverTo.tr()} ',
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
          Expanded(
            child: Text(
              address, // Tampilkan alamat dari parameter
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
              overflow:
                  TextOverflow.ellipsis, // Handle jika teks terlalu panjang
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
