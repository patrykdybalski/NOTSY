import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/pages/create_user_page/create_user_page.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/reset_password_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/sign_in_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_login_widget.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_password_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: _LoginPageBody(),
        ));
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody();

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

String? email;
String? password;

class _LoginPageBodyState extends State<_LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
            child: Column(children: [
              TextFieldLogin(
                onEmailChanged: (newValue) {
                  setState(() {
                    email = newValue;
                  });
                },
              ),
              TextFieldPassword(onPasswordChanged: (newValue) {
                setState(() {
                  password = newValue;
                });
              }),
              const ResetPasswordButton(),
              SignInButton(email, password),
              const SizedBox(height: 16),
              const CreateAccountButton(),
              const SizedBox(height: 10),
            ]),
          ),
        ),
      ]),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: AppColors.greenColor),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateUserPage(),
        ));
      },
      child: const Text('Utwórz konto',
          style: TextStyle(
            color: AppColors.greenLogoColor,
            fontSize: 16,
          )),
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
          'Witaj ponownie!',
          style: TextStyles.textStyle2(28),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
