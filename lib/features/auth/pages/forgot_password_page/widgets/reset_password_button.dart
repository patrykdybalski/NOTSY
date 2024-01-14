import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReserPasswordButton extends StatelessWidget {
  const ReserPasswordButton({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Pomyślnie wysłano link! Sprawdź swoją pocztę.',
                  style: TextStyle(
                    color: TextStyles.textStyle1(
                      14,
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyles.textStyle1(
                    14,
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context
                  .read<AuthCubit>()
                  .resetPasswordd(email: emailController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              elevation: 2,
              minimumSize: const Size(350, 50),
            ),
            child: Text(
              AppLocalizations.of(context).sendLink,
              style: TextStyles.textStyle2(
                17,
                Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
