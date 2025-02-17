import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;

  const TransferRecentUserItem({
    super.key,
    required this.user,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(
        22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: user.profilePicture == null
                    ? AssetImage('assets/img_profile.png')
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@${user.username}',
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 15,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 11,
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
