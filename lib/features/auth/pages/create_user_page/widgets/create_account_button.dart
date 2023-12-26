import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    required this.email,
    required this.password,
    super.key,
  });
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Pomyślnie utworzono konto!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red.shade300,
            ));
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greenLogoColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              minimumSize: const Size(280, 40),
            ),
            onPressed: () async {
              context.read<AuthCubit>().createUserAccount(
                    email: email!,
                    password: password!,
                  );
            },
            child: const Text(
              'Zarejestruj się',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
