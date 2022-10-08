import 'package:flutter/cupertino.dart';

class CategoryModel {
  bool status;
  CategoryDataModel data;
  CategoryModel({required this.status , required this.data });
  factory CategoryModel.fromJson({required Map json}){
    return CategoryModel(status: json["status"], data: CategoryDataModel.fromJson(json["data"]),);
  }
}

class CategoryDataModel {
  int? current_page;
  List<CategoruItemModel> data = [];

  CategoryDataModel.fromJson(Map json){
    current_page = json["current_page"];
    json["data"].forEach((element){
      data.add(CategoruItemModel.fromJson(element));
    });
  }
}


class CategoruItemModel {
  int id;
  String name;
  String  image;
  CategoruItemModel({required this.id , required this.name , required this.image });
  factory CategoruItemModel.fromJson(Map json){
    return CategoruItemModel(id: json["id"], name: json["name"], image: json["image"],);
  }
}