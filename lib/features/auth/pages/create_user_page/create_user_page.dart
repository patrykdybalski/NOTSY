import 'package:flutter/material.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/create_account_button.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/have_account_text_button.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/logo_image_name.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(height: 80),
          const LogoImageName(),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(1),
            elevation: 0.5,
            surfaceTintColor: Colors.transparent,
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
                    const HaveAccountTextButton(),
                    const SizedBox(height: 10),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
