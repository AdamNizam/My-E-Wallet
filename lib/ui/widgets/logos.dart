import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final double width;
  final double height;
  const CustomLogo({super.key, this.width = 155, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: 100, bottom: 50),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img_logo_light.png'),
        ),
      ),
    );
  }
}
