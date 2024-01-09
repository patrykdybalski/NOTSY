import 'package:flutter/material.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/create_account_text_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/logo_image.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background,
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
        horizontal: 16,
      ),
      child: Column(children: [
        const SizedBox(height: 80),
        const LogoImage(),
        Card(
          color: Theme.of(context).colorScheme.primary.withOpacity(1),
          elevation: 0.5,
          surfaceTintColor: Colors.transparent,
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
              const SizedBox(height: 8),
              const CreateAccountTextButton(),
              const SizedBox(height: 10),
            ]),
          ),
        ),
      ]),
    );
  }
}
