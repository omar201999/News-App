import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/Dio_helper.dart';
import 'package:news_app/shared/style/theme.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final bool? isDark;

  MyApp(
      this.isDark,
      );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewsCubit()
      ..changeAppMode(fromShared: isDark)
      ..getBusiness()
      ..getSports()
      ..getScience()
      ..getHealth(),

      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
