part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndexState extends HomeState {}

class HomeChangeIndexIndicatorState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class CategoryLoadingState extends HomeState {}

class CategorySuccessState extends HomeState {}

class CategoryErrorState extends HomeState {}

class FavoriteSuccessState extends HomeState {}

class FavoriteErrorState extends HomeState {}

class FavoriteChanfeState extends HomeState {}

class HomeFavoriteSuccessState extends HomeState {}

class HomeFavoriteErrorState extends HomeState {}

class HomeFavoriteLoadedState extends HomeState {}

class UserLoginSuccessState extends HomeState {}

class UserLoginErrorState extends HomeState {}

class UserLoginLoadedState extends HomeState {}

class ChangeInfoSuccessState extends HomeState {}

class ChangeInfoErrorState extends HomeState {}

class ChangeInfoLoadedState extends HomeState {}


class SearchSuccessState extends HomeState {}

class SearchErrorState extends HomeState {}

class SearchLoadedState extends HomeState {}
