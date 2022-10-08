part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoginLoadingState extends UserState {}

class UserLoginSuccessState extends UserState { 
  ShopLoginModel shopLoginModel;
  UserLoginSuccessState(this.shopLoginModel);
}

class UserLoginErrorState extends UserState {
  String error;
  UserLoginErrorState(this.error);
}

class UserLoginShowPassState extends UserState {}

class UserSignUpLoadingState extends UserState {}

class UserSignUpSuccessState extends UserState {}

class UserSignUpErrorState extends UserState {
  String error;
  UserSignUpErrorState(this.error);
}

class SignUpLoadedDone extends UserState{}
class SignUpSuccessDone extends UserState{}
class SignUpErrorDone extends UserState{}