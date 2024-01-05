import 'package:flutter/material.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
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
              const SizedBox(height: 8),
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
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateUserPage(),
        ));
      },
      child: Text('Utwórz konto',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
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
          'HOOKIT.',
          style: TextStyles.textStyle2(
            34,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Witaj ponownie,',
              style: TextStyles.textStyle1(
                22,
                Theme.of(context).colorScheme.tertiary,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Zaloguj się!',
              style: TextStyles.textStyle2(
                18,
                Theme.of(context).colorScheme.inversePrimary,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
