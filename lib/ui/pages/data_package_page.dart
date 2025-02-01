import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_data_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Data'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {},
        ),
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
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 15,
            children: [
              PackageDataItem(
                imgUrl: 'assets/img_friend2.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: true,
              ),
              PackageDataItem(
                imgUrl: 'assets/img_friend1.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: false,
              ),
              PackageDataItem(
                imgUrl: 'assets/img_friend4.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: false,
              ),
              PackageDataItem(
                imgUrl: 'assets/img_friend3.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: false,
              ),
              PackageDataItem(
                imgUrl: 'assets/img_friend4.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: false,
              ),
              PackageDataItem(
                imgUrl: 'assets/img_friend3.png',
                name: 'Bengoh',
                username: 'Beng0h37',
                isSelected: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
