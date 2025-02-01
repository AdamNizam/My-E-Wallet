import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning, color: whiteColor),
        const SizedBox(width: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: whiteTextStyle,
        ),
      ],
    ),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}
