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
          onPressed: () async {
            if (await Navigator.pushNamed(context, '/pin') == true) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/data-success', (route) => false);
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
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
            spacing: 18,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              PackageDataItem(
                amount: 10,
                price: 20000,
                isSelected: true,
              ),
              PackageDataItem(
                amount: 15,
                price: 32000,
              ),
              PackageDataItem(
                amount: 20,
                price: 59000,
              ),
              PackageDataItem(
                amount: 40,
                price: 110000,
              ),
              PackageDataItem(
                amount: 67,
                price: 230000,
              ),
              PackageDataItem(
                amount: 100,
                price: 1000000,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
