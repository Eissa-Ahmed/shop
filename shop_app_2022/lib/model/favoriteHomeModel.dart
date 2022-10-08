class HomeFavoriteModel {
  bool status;
  DataFavorieModel data;
  HomeFavoriteModel({required this.status, required this.data});
  factory HomeFavoriteModel.fromJson(Map json) {
    return HomeFavoriteModel(status: json["status"], data: DataFavorieModel.fromJson(json["data"]));
  }
}

class DataFavorieModel {
  int? current_page;
  List<DataDatFavoriteModel> data = [];
  DataFavorieModel({ required this.current_page , required this.data });
  DataFavorieModel.fromJson(Map json){
    current_page = json["current_page"];
    json["data"].forEach((element){
      data.add(DataDatFavoriteModel.fromJson(element));
    });
  }
}

class DataDatFavoriteModel {
  int id;
  FavoriteProduct product;
  DataDatFavoriteModel({ required this.id , required this.product });
  factory DataDatFavoriteModel.fromJson(Map json){
    return DataDatFavoriteModel(id: json["id"], product: FavoriteProduct.fromJson(json["product"]));
  }

}

class FavoriteProduct {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  String name;
  FavoriteProduct(
      {required this.id,
      required this.discount,
      required this.image,
      required this.name,
      required this.old_price,
      required this.price});
  factory FavoriteProduct.fromJson(Map json) {
    return FavoriteProduct(
        id: json["id"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        old_price: json["old_price"],
        price: json["price"]);
  }
}
