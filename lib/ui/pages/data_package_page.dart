import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_data_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel? operatorCard;

  const DataPackagePage({
    super.key,
    required this.operatorCard,
  });

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');

  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Data'),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: (selectedDataPlan != null && phoneController.text.isNotEmpty)
            ? CustomFilledButton(
                title: 'Continue',
                onPressed: () {},
              )
            : SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showCustomSnackbar(
                        context, "You don't select of data yet!");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueAcientColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56),
                    ),
                  ),
                  child: Text(
                    'Select Of Data',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
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
            controller: phoneController,
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
            children: widget.operatorCard!.dataPlans!.map((dataPlan) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDataPlan = dataPlan;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    selectedDataPlan = null;
                  });
                },
                child: PackageDataItem(
                  dataPlan: dataPlan,
                  isSelected: dataPlan.id == selectedDataPlan?.id,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
