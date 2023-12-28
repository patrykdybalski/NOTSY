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
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          forceMaterialTransparency: true,
        ),
        body: const SingleChildScrollView(
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
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
            color: AppColors.greenColor,
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
        const Image(
          image: AssetImage('assets/images/logo@1.png'),
        ),
        const SizedBox(height: 6),
        Text(
          'HOOKiT.',
          style: TextStyles.textStyle2(34),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Witaj ponownie,',
              style: TextStyles.textStyleBlue1(22),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Zaloguj się!',
              style: TextStyles.textStyle2(18),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
