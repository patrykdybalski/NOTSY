import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/auth/cubit/login_cubit.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            LoginCubit(LoginAuthRepository(LoginAuthDataSource())),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Pomyślnie wysłano link! Sprawdź swoją pocztę.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: AppColors.greenLogoColor,
                ),
              );
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: AppColors.redColor,
                ),
              );
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Podaj swój adres email, otrzymasz link do resetu hasła.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(0, 1.0),
                            color: Colors.grey.withOpacity(0.4),
                          )
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppColors.greenLogoColor
                                : Colors.grey,
                          ),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.greenLoginColor,
                              width: 0.6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<LoginCubit>()
                              .resetPasswordd(email: emailController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenLogoColor,
                        ),
                        child: const Text(
                          'Zresetuj hasło',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
