import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/more_dialog.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
              ),
              label: 'history',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 20,
              ),
              label: 'statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 20,
              ),
              label: 'reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 10,
          ),
          buildProfile(context),
          walletCard(),
          buildLevel(context),
          buildServices(context),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  // Widgnet

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: grayTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.username.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? AssetImage('assets/img_profile.png')
                            : NetworkImage(state.user.profilePicture!)
                                as ImageProvider,
                      ),
                    ),
                    child: state.user.verified == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 16,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget walletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_bg_card.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  state.user.cardNumber!.replaceAllMapped(
                      RegExp(r".{4}"), (match) => "${match.group(0)} "),
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: blackBold,
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Balance :',
                  style: whiteTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/history-transaction');
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Level 1',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '55% ',
                        style: greenTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 14),
                      ),
                      Text(
                        'of ${formatCurrency(state.user.balance ?? 0)}',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: LinearProgressIndicator(
                      value: 0.55,
                      minHeight: 8,
                      valueColor: AlwaysStoppedAnimation(greenColor),
                      backgroundColor: lightBackgroundColor,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something Today',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_top_up.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send To',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransaction() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionFailed) {
                    showCustomSnackbar(
                        context, 'History transaction not found');
                  }

                  if (state is TransactionSuccess) {
                    return Column(
                      children: state.transaction.map((transaction) {
                        return HomeLatestTransactionItem(
                            transaction: transaction);
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
            ),
          )
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserFailed) {
                showCustomSnackbar(context, 'Not Found');
              }
              if (state is UserSuccess) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.users.map((users) {
                      return HomeUserItem(user: users);
                    }).toList(),
                  ),
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
            }),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tips For You',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            runSpacing: 12,
            spacing: 12,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              HomeTipsItem(
                imgUrl: 'assets/img_tips1.png',
                title: 'How to use A Greate',
                url: 'https://www.google.com/',
              ),
              HomeTipsItem(
                imgUrl: 'assets/img_tips2.png',
                title: 'How to use A Greate',
                url: 'ngasal',
              ),
              HomeTipsItem(
                imgUrl: 'assets/img_tips3.png',
                title: 'How to use A Greate How to use A Greate',
                url: 'https://github.com/AdamNizam/My-E-Wallet',
              ),
              HomeTipsItem(
                imgUrl: 'assets/img_tips4.png',
                title: 'How to use A Greate',
                url: 'https://github.com/AdamNizam/My-E-Wallet',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
