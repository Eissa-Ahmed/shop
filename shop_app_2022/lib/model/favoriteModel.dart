class FavoriteModel {
  bool stauts;
  String massege;
  FavoriteModel({ required this.massege , required this.stauts });
  factory FavoriteModel.fromJson(Map json){
    return FavoriteModel(massege: json["message"], stauts: json["status"],);
  }
}