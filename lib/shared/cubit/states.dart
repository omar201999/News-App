abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates{}

class NewsGetSportErrorState extends NewsStates{
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetHealthSuccessState extends NewsStates{}

class NewsGetHealthErrorState extends NewsStates{
  final String error;

  NewsGetHealthErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsStates {}

class NewsGetTechnologySuccessState extends NewsStates{}

class NewsGetTechnologyErrorState extends NewsStates{
  final String error;

  NewsGetTechnologyErrorState(this.error);
}

class NewsChangeModeState extends NewsStates {}


class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}