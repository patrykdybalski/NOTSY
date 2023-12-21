import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/create_user_page/create_user_page.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/reset_password_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/sign_in_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_login_widget.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_password_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
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
                  padding: const EdgeInsets.all(20),
                  child: LoginPageBody(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    required this.emailController,
    required this.passwordController,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LogoImageContainer(),
      Text(
        'Zaloguj się',
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
          child: Column(children: [
            TextFieldLogin(emailController: emailController),
            TextFieldPassword(passwordController: passwordController),
            const ResetPasswordButton(),
            SignInButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 16),
            const CreateAccountButton(),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    ]);
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
          builder: (context) => CreateUserPage(),
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
