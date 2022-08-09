import 'package:flutter/material.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/health/health_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/Dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/news_icons.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(
      icon: Icon(
        NewsIcons.business,
      ),
      label: 'Business',
    ),
    const  BottomNavigationBarItem(
      icon:
      Icon(
        NewsIcons.soccer_ball,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        NewsIcons.science,
      ),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        NewsIcons.health_care,
      ),
      label: 'health',
    ),
  ];

  List <Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];

  void changeBottomNavBar(int index){

    currentIndex = index;
    if(index==0) getBusiness();
    if(index==1) getSports();
    if(index==2) getScience();
    if(index==3) getHealth();


    emit(NewsBottomNavState());
  }

  List<dynamic> business =[];

  void getBusiness()
  {

    emit(NewsGetBusinessLoadingState());
    if(business.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'d78039df47974ecc84a30f7b311d8b0e',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        emit(NewsGetBusinessErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetBusinessSuccessState());
    }

  }

  List<dynamic> sports =[];

  void getSports()
  {
    emit(NewsGetSportLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apiKey':'d78039df47974ecc84a30f7b311d8b0e',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((error){
        emit(NewsGetSportErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetSportSuccessState());
    }

  }

  List<dynamic> science=[];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'d78039df47974ecc84a30f7b311d8b0e',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        emit(NewsGetScienceErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> health =[];

  void getHealth()
  {
    emit(NewsGetHealthLoadingState());
    if(health.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'health',
          'apiKey':'d78039df47974ecc84a30f7b311d8b0e',
        },
      ).then((value) {
        health = value.data['articles'];
        emit(NewsGetHealthSuccessState());
      }).catchError((error){
        emit(NewsGetHealthErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetHealthSuccessState());
    }

  }



  List<dynamic> search =[];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q':'$value',

        'apiKey':'64dc4ac09c7140bc8d73151e446b88d4',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }


  bool isDark = false;
  void changeAppMode( {bool? fromShared})
  {
    if(fromShared !=null){
      isDark=fromShared;
      emit(NewsChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).
      then((value) {
        emit(NewsChangeModeState());
      });
    }
  }

}