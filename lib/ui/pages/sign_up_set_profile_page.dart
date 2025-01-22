import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/logos.dart';
import 'package:flutter/material.dart';

class SignUpSetProfilePage extends StatelessWidget {
  const SignUpSetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          CustomLogo(),
          CustomTextTitle(
            title: 'Join Us to Unlock\nYour Growth',
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: lightBackgroundColor,
                //   ),
                //   child: Center(
                //     child: Image.asset(
                //       'assets/ic_upload.png',
                //       width: 35,
                //     ),
                //   ),
                // ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Syahna Hadid',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomFormField(title: 'Set PIN (6 digit number)'),
                SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-id_card');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
