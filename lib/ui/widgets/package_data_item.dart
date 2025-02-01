import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageDataItem extends StatelessWidget {
  final int amount;
  final int price;
  final bool isSelected;
  const PackageDataItem({
    super.key,
    this.isSelected = false,
    required this.amount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(
                color: blueColor,
                width: 2,
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${amount}GB',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Rp.$price',
            style: grayTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
