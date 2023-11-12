import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/cubit/root_cubit.dart';
import 'package:primary_school/app/features/auth/login_page.dart';
import 'package:primary_school/app/features/home/home_page.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/constans/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Last Check Only',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RootCubit>()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Smoething went wrong ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoadnig) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final user = state.user;
          if (user == null) {
            return LoginPage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
