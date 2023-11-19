import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/cubit/login_cubit.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/forgot_password_page.dart';
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
      child: BlocListener<AuthCubit, AuthState>(
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
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: AppColors.primaryColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
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
                      const SizedBox(
                        height: 24,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const ForgotPasswordPage();
                                      }));
                                    },
                                    child: Text(
                                      isCreatingAccount == true
                                          ? ''
                                          : 'Nie pamiętasz hasła?',
                                      style: const TextStyle(
                                        color: AppColors.redColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenLogoColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 100,
                                    vertical: 0,
                                  ),
                                ),
                                onPressed: () async {
                                  if (isCreatingAccount == true) {
                                    context
                                        .read<AuthCubit>()
                                        .createUserAccount(
                                          email: widget.emailController.text,
                                          password:
                                              widget.passwordController.text,
                                        );
                                  } else {
                                    context.read<AuthCubit>().signIn(
                                          email: widget.emailController.text,
                                          password:
                                              widget.passwordController.text,
                                        );
                                  }
                                },
                                child: Text(
                                  isCreatingAccount == true
                                      ? 'Zarejestruj się'
                                      : 'Zaloguj się ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
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
                                      fontSize: 15,
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
      ),
    );
  }
}
