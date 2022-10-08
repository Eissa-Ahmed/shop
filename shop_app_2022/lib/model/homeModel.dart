class HomeModel {
  bool status;
  DataHomeModel data;
  HomeModel({required this.status, required this.data});
  factory HomeModel.fromJson({required Map<dynamic, dynamic> json}) {
    return HomeModel(
      status: json["status"],
      data: DataHomeModel.fromJson(json: json["data"]),
    );
  }
}

class DataHomeModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];
  DataHomeModel({required this.banners, required this.products});
  DataHomeModel.fromJson({required Map json}) {
    json["banners"].forEach((element) {
      banners.add(BannersModel.fromJson(json: element));
    });
    json["products"].forEach((element) {
      products.add(ProductsModel.fromJson(json: element));
    });
  }
}

class BannersModel {
  int id;
  String image;
  BannersModel({required this.id, required this.image});
  factory BannersModel.fromJson({required Map json}) {
    return BannersModel(id: json["id"], image: json["image"]);
  }
}

class ProductsModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorite;
  bool inCard;

  ProductsModel({
    required this.id,
    required this.image,
    required this.inCard,
    required this.inFavorite,
    required this.name,
    required this.oldPrice,
    required this.price,
    required this.discount,
  });
  factory ProductsModel.fromJson({required Map json}) {
    return ProductsModel(
      id: json["id"],
      image: json["image"],
      inCard: json["in_cart"],
      inFavorite: json["in_favorites"],
      name: json["name"],
      oldPrice: json["old_price"],
      price: json["price"],
      discount: json["discount"],
    );
  }
}
