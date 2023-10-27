import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/cubit/root_cubit.dart';
import 'package:primary_school/app/features/auth/text_fields_login_page.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';

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
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(
        LoginAuthRepository(
          LoginAuthDataSource(),
        ),
      ),
      child: BlocListener<RootCubit, RootState>(
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
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                color: Color(0xfff6f3f0),
              ),
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/logo_login_page.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              isCreatingAccount == true
                                  ? 'Zarejestruj się'
                                  : 'Zaloguj się',
                              style: GoogleFonts.dosis(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  TextFieldLogin(widget: widget),
                                  TextFieldPassword(widget: widget),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Nie pamiętasz hasła?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.greenLoginColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 60,
                                        vertical: 10,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (isCreatingAccount == true) {
                                        context.read<RootCubit>().createUser(
                                              email:
                                                  widget.emailController.text,
                                              password: widget
                                                  .passwordController.text,
                                            );
                                      } else {
                                        context.read<RootCubit>().signIn(
                                              email:
                                                  widget.emailController.text,
                                              password: widget
                                                  .passwordController.text,
                                            );
                                      }
                                    },
                                    child: Text(
                                      isCreatingAccount == true
                                          ? 'Zarejestruj się'
                                          : 'Zaloguj się ',
                                    ),
                                  ),
                                  if (isCreatingAccount == false) ...[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            AppColors.greenLoginColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isCreatingAccount = true;
                                        });
                                      },
                                      child: const Text(
                                        'Utwórz konto',
                                      ),
                                    ),
                                  ],
                                  if (isCreatingAccount == true) ...[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            AppColors.greenLoginColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isCreatingAccount = false;
                                        });
                                      },
                                      child: const Text(
                                        'Masz już konto?',
                                      ),
                                    ),
                                  ],
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
