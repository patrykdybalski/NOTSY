import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:primary_school/app/cubit/root_cubit.dart';
import 'package:primary_school/app/features/auth/login_page.dart';
import 'package:primary_school/app/features/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white70,
        ),
        home: const RootPage() //const RootPage(),
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
        create: (context) => RootCubit()..start(),
        child: BlocBuilder<RootCubit, RootState>(builder: (context, state) {
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
          }
          return const HomePage();
        }));
  }
}
