import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';

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
              backgroundColor: AppColors.greenColor,
            ),
            child: Text('Wyloguj',
                style: GoogleFonts.domine(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                )),
          );
        },
      ),
    );
  }
}
