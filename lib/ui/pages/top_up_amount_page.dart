import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/topup/topup_bloc.dart';
import 'package:bank_sha/models/top_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopUpAmountPage extends StatefulWidget {
  final TopUpFormModel data;

  const TopUpAmountPage({
    super.key,
    required this.data,
  });

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');
  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text == '' ? '0' : text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deletePin() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupSuccess) {
              final Uri url = Uri.parse(state.redirectUrl);

              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }

              if (!context.mounted) return;
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/topup-success', (route) => false);
            }
            if (state is TopupFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            if (state is TopupLoading) {
              return Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 6.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(blueColor),
                  ),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Total Amount',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: amountController,
                      cursorColor: blueColor,
                      readOnly: true,
                      style: whiteTextStyle.copyWith(
                        fontSize: 28,
                        fontWeight: medium,
                      ),
                      decoration: InputDecoration(
                        prefix: Text(
                          'Rp ',
                          style: whiteTextStyle.copyWith(
                            fontSize: 28,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: grayColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: blueColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  child: Wrap(
                    spacing: 45,
                    runSpacing: 30,
                    children: [
                      CustomInputButton(
                        tittle: '1',
                        onTap: () {
                          addAmount('1');
                        },
                      ),
                      CustomInputButton(
                        tittle: '2',
                        onTap: () {
                          addAmount('2');
                        },
                      ),
                      CustomInputButton(
                        tittle: '3',
                        onTap: () {
                          addAmount('3');
                        },
                      ),
                      CustomInputButton(
                        tittle: '4',
                        onTap: () {
                          addAmount('4');
                        },
                      ),
                      CustomInputButton(
                        tittle: '5',
                        onTap: () {
                          addAmount('5');
                        },
                      ),
                      CustomInputButton(
                        tittle: '6',
                        onTap: () {
                          addAmount('6');
                        },
                      ),
                      CustomInputButton(
                        tittle: '7',
                        onTap: () {
                          addAmount('7');
                        },
                      ),
                      CustomInputButton(
                        tittle: '8',
                        onTap: () {
                          addAmount('8');
                        },
                      ),
                      CustomInputButton(
                        tittle: '9',
                        onTap: () {
                          addAmount('9');
                        },
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                      ),
                      CustomInputButton(
                        tittle: '0',
                        onTap: () {
                          addAmount('0');
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          deletePin();
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: numberBackgroundColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Checkout Now',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      if (!context.mounted) return;

                      final authState = context.read<AuthBloc>().state;

                      String pin = '';

                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TopupBloc>().add(
                            TopupPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  title: 'Terms & Conditions',
                  onPressed: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
