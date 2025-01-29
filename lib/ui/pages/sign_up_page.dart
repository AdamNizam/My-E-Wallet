import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/logos.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE : USERNAME INPUT
                CustomFormField(title: 'Full Name'),
                SizedBox(
                  height: 16,
                ),
                // NOTE : EMAIL INPUT
                CustomFormField(title: 'Email Address'),
                SizedBox(
                  height: 16,
                ),
                // NOTE : PASSWORD INPUT
                CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-profile');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextButton(
            title: 'Sign In',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          )
        ],
      ),
    );
  }
}
