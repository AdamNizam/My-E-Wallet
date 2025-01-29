import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String title;
  const CustomTextTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
    );
  }
}

class CustomLogo extends StatelessWidget {
  final double width;
  final double height;
  const CustomLogo({super.key, this.width = 155, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: 80, bottom: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img_logo_light.png'),
        ),
      ),
    );
  }
}
