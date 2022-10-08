import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_2022/constant/dio.dart';
import 'package:bloc/bloc.dart';
import '../../../../model/signInModel.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: "login", data: {
      "email": email,
      "password": password,
    }).then((value) {
      shopLoginModel = ShopLoginModel.fromJson(value.data);
      print("========================");
      emit(UserLoginSuccessState(shopLoginModel!));
    }).catchError((error) {
      print("SignIn XXXXXXXXXXXXXXXXXXXXXXXX");
      print(error.toString());
      emit(UserLoginErrorState(error.toString()));
    });
  }

  String userName = "";
  String phone = "";
  String email = "";
  String password = "";
  bool showPass = true;

  showPassword() {
    if (showPass == true) {
      showPass = false;
    } else {
      showPass = true;
    }
    emit(UserLoginShowPassState());
  }

  ShopLoginModel? shopLoginModel;

  Future signupDone({
    required String emailx,
    required String phonex,
    required String namex,
    required String passwordx,
  }) {
    emit(SignUpLoadedDone());
    return DioHelper.postData(url: "register", data: {
      "email": emailx,
      "phone": phonex,
      "password": passwordx,
      "name": namex,
    }).then((value) {
      print("Done SignUp ==================");
      print(value.toString());
      emit(SignUpSuccessDone());
    }).catchError((onError) {
      print("Error SignUp xxxxxxxxxxxxxxxxxxxx");
      emit(SignUpErrorDone());
    });
  }
}
