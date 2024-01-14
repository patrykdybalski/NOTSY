import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/theme/theme.dart';
import 'package:primary_school/app/constans/theme/theme_provider.dart';
import 'package:primary_school/app/core/config.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/root_page/cubit/root_cubit.dart';
import 'package:primary_school/features/auth/pages/login_page/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primary_school/features/home/home_page/home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      title: 'Last Check Only',
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
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

          final user = state.user;
          if (user == null) {
            return const LoginPage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
