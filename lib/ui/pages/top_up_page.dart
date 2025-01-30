import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/banks_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '888 2022 177',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Syahnan Achmad',
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BanksItem(
            title: 'BANK BCA',
            imgUrl: 'assets/img_bank_bca.png',
            isSelected: true,
          ),
          BanksItem(
            title: 'BANK BNI',
            imgUrl: 'assets/img_bank_bni.png',
          ),
          BanksItem(
            title: 'BANK MANDIRI',
            imgUrl: 'assets/img_bank_mandiri.png',
          ),
          BanksItem(
            title: 'BANK OCBC',
            imgUrl: 'assets/img_bank_ocbc.png',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: CustomFilledButton(
      //     title: 'Continue',
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/topup-amount');
      //     },
      //   ),
      // ),
    );
  }
}
