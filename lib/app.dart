import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/modules/splash/splash_screen.dart';
import 'package:world_news/shared/styles/themes.dart';

class MyApp extends StatelessWidget {

  final bool isDark;

  const MyApp(
  {
    required this.isDark,
  }
      );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) =>  AppCubit()..changeAppMode(
          fromShared: isDark,
        )..getGeneral(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener:(context, state) {} ,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            AppCubit
                .get(context)
                .isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}