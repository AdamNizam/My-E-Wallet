import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final bool isShowTitle;
  final TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.isShowTitle = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
          ),
        if (isShowTitle)
          SizedBox(
            height: 8,
          ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          cursorColor: blueColor,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            hintStyle: grayTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: !isShowTitle ? whiteColor : blackColor,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: blueColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: whiteColor,
          ),
        ),
      ],
    );
  }
}
