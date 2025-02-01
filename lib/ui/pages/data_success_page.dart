import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DataSuccessPage extends StatelessWidget {
  const DataSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Paket Data \nBerhasil Terbeli',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              'Use the money wisely and \ngrow your finance',
              style: grayTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 55,
            ),
            CustomFilledButton(
              width: 183,
              title: 'Back to home',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (Route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
