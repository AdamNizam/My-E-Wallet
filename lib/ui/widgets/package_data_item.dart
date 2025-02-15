import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageDataItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const PackageDataItem({
    super.key,
    required this.dataPlan,
    this.isSelected = false,
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
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlan.price ?? 0),
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
