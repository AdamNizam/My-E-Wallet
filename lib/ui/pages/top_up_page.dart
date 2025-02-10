import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_methods_form_model.dart';
import 'package:bank_sha/models/top_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/top_up_amount_page.dart';
import 'package:bank_sha/ui/widgets/banks_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodsFormModel? selectedPaymentMethod;
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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
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
                          state.user.name.toString(),
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
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
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                      children: state.paymentMethod.map((paymentMethods) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPaymentMethod = paymentMethods;
                        });
                      },
                      child: BanksItem(
                        paymentMethod: paymentMethods,
                        isSelected:
                            paymentMethods.id == selectedPaymentMethod?.id,
                      ),
                    );
                  }).toList());
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
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: selectedPaymentMethod != null
            ? CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUpAmountPage(
                        data: TopUpFormModel(
                          paymentMethodCode: selectedPaymentMethod?.code,
                        ),
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
                        context, "You don't select of Bank yet!");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56),
                    ),
                  ),
                  child: Text(
                    'Select Of Bank',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
              ),
      ),
    );
  }
}
