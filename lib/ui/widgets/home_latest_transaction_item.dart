import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    super.key,
    required this.transaction,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          Image.network(
            transaction.transactionType?.code == 'transfer'
                ? 'https://bwabank.my.id/storage/Nmmdj2yh1D.png'
                : 'https://bwabank.my.id/storage/xmamMx8utB.png',
            width: 48,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/img_logo_light.png', // Gambar default
                width: 48,
              );
            },
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('dd MMMM hh:mm')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType!.action == 'cr' ? '- ' : '+ '),
            style: transaction.transactionType!.action == 'cr'
                ? redTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  )
                : greenTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
          ),
        ],
      ),
    );
  }
}
