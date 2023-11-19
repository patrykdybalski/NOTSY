import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/reset_password_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/sign_in_or_create_account_button.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_login_widget.dart';
import 'package:primary_school/features/auth/pages/login_page/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isCreatingAccount = false;

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
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/last_check_logo1.png'),
                        ),
                      ),
                    ),
                    Text(
                      isCreatingAccount == true
                          ? 'Zarejestruj się'
                          : 'Zaloguj się',
                      style: TextStyles.textStyle2(34),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          4.0,
                          0,
                          4.0,
                          16,
                        ),
                        child: Column(
                          children: [
                            TextFieldLogin(widget: widget),
                            TextFieldPassword(widget: widget),
                            ResetPasswordButton(
                              isCreatingAccount: isCreatingAccount,
                            ),
                            SignInOrCreateAccountButton(
                              isCreatingAccount: isCreatingAccount,
                              widget: widget,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            if (isCreatingAccount == false) ...[
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.greenColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isCreatingAccount = true;
                                  });
                                },
                                child: const Text(
                                  'Utwórz konto',
                                  style: TextStyle(
                                    color: AppColors.greenLogoColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                            if (isCreatingAccount == true) ...[
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.greenLoginColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isCreatingAccount = false;
                                  });
                                },
                                child: const Text(
                                  'Mam juz konto',
                                  style: TextStyle(
                                    color: AppColors.greenLogoColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
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
