import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');

  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFileSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                selectedUser == null;
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          // buildResults(),
          usernameController.text.isEmpty ? buildRecentUsers() : buildResults(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: selectedUser != null
            ? CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (route) => TransferAmountPage(
                        data: TransferFormModel(sendTo: selectedUser!.username),
                      ),
                    ),
                  );
                },
              )
            : SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showCustomSnackbar(
                        context, "You don't select of user yet!");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: blueAcientColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(56),
                    ),
                  ),
                  child: Text(
                    'Select Of User',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children: state.users.map((user) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          selectedUser = null;
                        });
                      },
                      child: TransferRecentUserItem(
                        user: user,
                        isSelected: user.id == selectedUser?.id,
                      ),
                    );
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
        ],
      ),
    );
  }

  Widget buildResults() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                if (state.users.isEmpty) {
                  return Center(
                    child: Text(
                      'User tidak ditemukan',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  );
                }
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: state.users.map((user) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          selectedUser = null;
                        });
                      },
                      child: TransferResultUserItem(
                        user: user,
                        isSelected: user.id == selectedUser?.id,
                      ),
                    );
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
        ],
      ),
    );
  }
}
