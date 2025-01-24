import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeSeriveItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const HomeSeriveItem({
    super.key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Center(
            child: Image(
              image: AssetImage(iconUrl),
              width: 26,
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
      ],
    );
  }
}