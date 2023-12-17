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
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                  ),
                  child: LoginPageBody(loginPageContext: LoginPage()),
                ),
              ));
        },
      ),
    );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
    super.key,
    required this.loginPageContext,
  });

  final LoginPage loginPageContext;
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
            TextFieldLogin(widget: loginPageContext),
            TextFieldPassword(widget: loginPageContext),
            const ResetPasswordButton(),
            SignInButton(widget: loginPageContext),
            const SizedBox(height: 16),
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: AppColors.greenColor),
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
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    ]);
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
