import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:world_news/app.dart';
import 'package:world_news/shared/bloc_observer.dart';
import 'package:world_news/shared/network/local/cache_helper.dart';
import 'package:world_news/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  DioHelper.init();
  BlocOverrides.runZoned(() {
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}



