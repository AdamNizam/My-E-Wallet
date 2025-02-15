import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_package_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedOperatorCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: selectedOperatorCard != null
            ? CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPackagePage(
                        operatorCard: selectedOperatorCard!,
                      ),
                    ),
                  );
                },
              )
            : SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showCustomSnackbar(
                        context, "You don't select of Provider yet!");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueAcientColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56),
                    ),
                  ),
                  child: Text(
                    'Select Of Provider',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
              ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'From Wallet',
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          formatCurrency(state.user.balance ?? 0),
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards.map((operatorCard) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOperatorCard = operatorCard;
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            selectedOperatorCard = null;
                          });
                        },
                        child: DataProviderItem(
                          operatorCard: operatorCard,
                          isSelected:
                              operatorCard.id == selectedOperatorCard?.id,
                        ),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(blueColor),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
