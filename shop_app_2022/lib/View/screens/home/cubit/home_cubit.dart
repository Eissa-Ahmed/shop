import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/category.dart';
import 'package:shop_app_2022/View/screens/home/favorite.dart';
import 'package:shop_app_2022/View/screens/home/product.dart';
import 'package:shop_app_2022/View/screens/search/searchModel.dart';
import 'package:shop_app_2022/constant/dio.dart';
import 'package:shop_app_2022/constant/shared.dart';
import 'package:shop_app_2022/model/favoriteHomeModel.dart';
import 'package:shop_app_2022/model/favoriteModel.dart';
import 'package:shop_app_2022/model/homeModel.dart';
import 'package:shop_app_2022/model/signInModel.dart';

import '../../../../model/categoryModel.dart';
import '../settings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> homeScreen = [
    Product(),
    Category(),
    Favourite(),
    Settings(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  HomeModel? homeModel;
  CategoryModel? categoryModel;
  Map<int, bool> favorite = {};

  Future getDataHome() async {
    emit(HomeLoadingState());
    await DioHelper.getData(
      url: "home",
      token: CachHelper.sharedPreferences.get("token").toString(),
    ).then((value) {
      homeModel = HomeModel.fromJson(json: value.data);
      homeModel!.data.products.forEach((element) {
        favorite.addAll({
          element.id: element.inFavorite,
        });
        // print(favorite.toString());
      });
      emit(HomeSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(HomeErrorState());
    });
  }

  Future getDataCategory() async {
    emit(CategoryLoadingState());
    await DioHelper.getData(url: "categories").then((value) {
      categoryModel = CategoryModel.fromJson(json: value.data);
      emit(CategorySuccessState());
    }).catchError((onError) {
      print(onError);
      emit(CategoryErrorState());
    });
  }

  int currentIndexIndicator = 0;

  void changeIndexIndictor(int index) {
    currentIndexIndicator = index;
    // pageController.nextPage(
    //     duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    emit(HomeChangeIndexIndicatorState());
  }

  FavoriteModel? favoriteModel;
  Future changeFavorite(int id) async {
    favorite[id] = !favorite[id]!;
    emit(FavoriteChanfeState());
    await DioHelper.postData(
        token: CachHelper.sharedPreferences.get("token").toString(),
        url: "favorites",
        data: {
          "product_id": id,
        }).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      if (favoriteModel!.stauts == false) {
        favorite[id] = !favorite[id]!;
      }
      print(favoriteModel!.stauts);
      emit(FavoriteSuccessState());
    }).catchError((onError) {
      favorite[id] = !favorite[id]!;
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
      print(onError.toString());
      emit(FavoriteErrorState());
    });
  }

  HomeFavoriteModel? homeFavoriteModel;
  Future getDataFavorite() async {
    emit(HomeFavoriteLoadedState());
    await DioHelper.getData(
            url: "favorites",
            token: CachHelper.sharedPreferences.get("token").toString())
        .then((value) {
      homeFavoriteModel = HomeFavoriteModel.fromJson(value.data);
      emit(HomeFavoriteSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(HomeFavoriteErrorState());
    });
  }

  UserData? userLogin;
  Future getDataUser() async {
    emit(UserLoginLoadedState());
    await DioHelper.getData(
            url: "profile",
            token: CachHelper.sharedPreferences.get("token").toString())
        .then((value) {
      print("=====================Done");
      userLogin = UserData.fromJson(value.data["data"]);
      print(userLogin!.email);
      emit(UserLoginSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(UserLoginErrorState());
    });
  }

  Future putDataUser(
      {required String name,
      required String email,
      required String phone}) async {
    emit(ChangeInfoLoadedState());

    return await DioHelper.putData(
        path: "update-profile",
        token: CachHelper.sharedPreferences.get("token").toString(),
        data: {
          "name": name,
          "email": email,
          "phone": phone,
        }).then((value) {
      print(value.toString());
      emit(ChangeInfoSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(ChangeInfoErrorState());
    });
  }

  SearchModel? searchModel;

  Future postDataSearch({required String search}) async {
    emit(SearchLoadedState());

    return await DioHelper.postData(
        url: "products/search",
        token: CachHelper.sharedPreferences.get("token").toString(),
        data: {
          "text": search,
        }).then((value) {
      // print(value.toString());

      searchModel = SearchModel.fromJson(value.data);
      print("Done Search =============================");
      print(searchModel!.data.data[0].name);
      emit(SearchSuccessState());
    }).catchError((onError) {
      print("Error Search =============================");

      print(onError);
      emit(SearchErrorState());
    });
  }
  String search = "";
}
