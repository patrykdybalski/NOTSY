import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
    this.email,
    this.password, {
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
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              minimumSize: const Size(280, 40),
            ),
            onPressed: () {
              context.read<AuthCubit>().signIn(
                    email: email!,
                    password: password!,
                  );
            },
            child: Text(AppLocalizations.of(context).login,
                style: TextStyles.textStyle2(
                  17,
                  Theme.of(context).colorScheme.primary,
                )),
          );
        },
      ),
    );
  }
}
