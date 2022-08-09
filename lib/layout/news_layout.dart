import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/news_icons.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: const [
                      Text(
                        'News',
                        style: TextStyle(
                          fontSize: 25
                        ),
                      ),
                      Text(
                        'App',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F948B),
                          fontSize: 25
                        ),
                      )
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, SearchScreen());
                      },
                      icon: const Icon(
                      NewsIcons.search,
                    ),
                    ),
                    IconButton(
                      onPressed: () {
                        NewsCubit.get(context).changeAppMode();
                      },
                      icon: const Icon(
                        NewsIcons.moon_dark,
                      ),
                    ),
                  ],
                ),

                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                   cubit.changeBottomNavBar(index);
                  },
                  items: cubit.bottomItems,
                ),
              );
            },
            listener: (context, state) {},

    );
  }

}