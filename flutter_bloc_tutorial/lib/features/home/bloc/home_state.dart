part of 'home_bloc.dart';

@immutable
abstract class HomeState {} //Regular HomeState is just for building the UI.

//ActionState is for Action that is triggered.
abstract class HomeActionState extends HomeState {}

//---------------REGULAR STATE--------------------------------------------------

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

//---------------ACTION STATE---------------------------------------------------

class HomeNavigateToWishlishPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}
