import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_serive_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
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
          buildProfile(),
          walletCard(),
          buildLevel(),
          buildServices(),
        ],
      ),
    );
  }

  // Widgnet

  Widget buildProfile() {
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
                'Syahnan',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/img_profile.png'),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 20,
                height: 20,
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
            ),
          ),
        ],
      ),
    );
  }

  // Wallet Card

  Widget walletCard() {
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
            'Syahnan Achmad',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '**** **** **** 1280',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: extraBold,
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
            'Rp 12.502',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }

// Build Level
  Widget buildLevel() {
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
                style:
                    greenTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
              Text(
                'of Rp. 370.000',
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
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

// build service

  Widget buildServices() {
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
              HomeSeriveItem(
                iconUrl: 'assets/ic_top_up.png',
                title: 'Top Up',
                onTap: () {},
              ),
              HomeSeriveItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send To',
                onTap: () {},
              ),
              HomeSeriveItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeSeriveItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
