import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          // buildResults(),
          buildRecentUsers(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friend3.png',
            name: 'Lutung',
            username: 'lth',
            isVerified: true,
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friend1.png',
            name: 'Ukelele',
            username: 'Beng0h37',
            isVerified: false,
          ),
          TransferRecentUserItem(
            imgUrl: 'assets/img_friend2.png',
            name: 'Bengoh',
            username: 'Beng0h37',
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget buildResults() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 15,
            children: [
              TransferResultUserItem(
                imgUrl: 'assets/img_friend2.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: true,
                isSelected: true,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friend1.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: false,
                isSelected: false,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friend4.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: true,
                isSelected: false,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friend3.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: true,
                isSelected: false,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friend4.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: false,
                isSelected: false,
              ),
              TransferResultUserItem(
                imgUrl: 'assets/img_friend3.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isVerified: false,
                isSelected: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
