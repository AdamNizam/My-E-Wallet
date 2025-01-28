import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  cursorColor: blueColor,
                  obscuringCharacter: '*',
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: medium,
                    letterSpacing: 10,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: grayColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: blueColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 35,
                runSpacing: 35,
                children: [
                  CustomInputButton(
                    tittle: '1',
                    onTap: () {
                      addPin('1');
                    },
                  ),
                  CustomInputButton(
                    tittle: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  CustomInputButton(
                    tittle: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  CustomInputButton(
                    tittle: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  CustomInputButton(
                    tittle: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  CustomInputButton(
                    tittle: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  CustomInputButton(
                    tittle: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  CustomInputButton(
                    tittle: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  CustomInputButton(
                    tittle: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  CustomInputButton(
                    tittle: '0',
                    onTap: () {},
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 24,
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
