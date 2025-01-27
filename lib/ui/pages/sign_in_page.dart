import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/logos.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
            title: 'Sign In & \nGrow Your Finance',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE : EMAIL INPUT
                CustomFormField(title: 'Email Address'),
                SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password',
                    style: blueTextStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextButton(
            title: 'Create New Account',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
          )
        ],
      ),
    );
  }
}
