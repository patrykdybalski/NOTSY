import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        forceMaterialTransparency: true,
      ),
      body: const _CreatePagebody(),
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
                    const SizedBox(height: 38),
                    CreateAccountButton(
                      email: email,
                      password: password,
                    ),
                    const SizedBox(height: 8),
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
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(
        'Mam już konto',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
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
        const Image(
          image: AssetImage('assets/images/logo@1.png'),
        ),
        const SizedBox(height: 6),
        Text(
          'HOOKIT',
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
              'Uwtórz konto,',
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
              'Zapraszamy!',
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
