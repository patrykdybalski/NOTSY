import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/create_account_button.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_email.dart';
import 'package:primary_school/features/auth/pages/create_user_page/widgets/textfield_create_password.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red.shade300,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(children: [
                    const LogoImageContainer(),
                    Text(
                      'Zarejestruj się',
                      style: TextStyles.textStyle2(34),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 16),
                        child: CreatePageBody(CreateUserPage()),
                      ),
                    ),
                  ]),
                ),
              ));
        },
      ),
    );
  }
}

class CreatePageBody extends StatelessWidget {
  const CreatePageBody(
    this.createUserPage, {
    super.key,
  });

  final CreateUserPage createUserPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCreateEmail(createUserPage),
        TextFieldCreatePassword(createUserPage),
        const SizedBox(height: 32),
        CreateAccountButton(createUserPage),
        const SizedBox(height: 16),
        const BackToLoginPageButton()
      ],
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
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        'Mam juz konto',
        style: TextStyle(
          color: AppColors.greenLogoColor,
          fontSize: 16,
        ),
      ),
    );
  }
}

class LogoImageContainer extends StatelessWidget {
  const LogoImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/last_check_logo1.png'),
        ),
      ),
    );
  }
}
