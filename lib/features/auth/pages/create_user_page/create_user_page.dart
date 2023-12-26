import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/create_account_button.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_email.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_password.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: _CreatePagebody(),
    );
  }
}

class _CreatePagebody extends StatefulWidget {
  const _CreatePagebody();

  @override
  State<_CreatePagebody> createState() => _CreatePagebodyState();
}

String? email;
String? password;

class _CreatePagebodyState extends State<_CreatePagebody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const LogoImageContainer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Column(
                  children: [
                    TextFieldCreateEmail(onEmailChanged: (newValue) {
                      setState(() {
                        email = newValue;
                      });
                    }),
                    TextFieldCreatePassword(
                      onPasswordChanged: (newValue) {
                        setState(() {
                          password = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 32),
                    CreateAccountButton(
                      email: email,
                      password: password,
                    ),
                    const SizedBox(height: 16),
                    const BackToLoginPageButton(),
                    const SizedBox(height: 10),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}

class BackToLoginPageButton extends StatelessWidget {
  const BackToLoginPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.greenLoginColor,
      ),
      child: const Text(
        'Mam juz konto',
        style: TextStyle(
          color: AppColors.greenLogoColor,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class LogoImageContainer extends StatelessWidget {
  const LogoImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/last_check_logo1.png'),
            ),
          ),
        ),
        Text(
          'Zarejestruj się!',
          style: TextStyles.textStyle2(28),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
