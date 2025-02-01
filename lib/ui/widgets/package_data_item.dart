import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageDataItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isSelected;
  const PackageDataItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.username,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 173,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 17,
      ),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? blueColor : whiteColor,
            width: 2,
          )),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@$username',
            style: grayTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
