import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: Text(AppLocalizations.of(context).logOut,
                style: TextStyles.textStyle2(
                  18,
                  Theme.of(context).colorScheme.primary,
                )),
          );
        },
      ),
    );
  }
}
