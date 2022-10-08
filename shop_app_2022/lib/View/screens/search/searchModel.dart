class SearchModel {
  bool status;
  DataSearchModel data;
  SearchModel({required this.data, required this.status});
  factory SearchModel.fromJson(Map json) {
    return SearchModel(
        data: DataSearchModel.fromJson(json["data"]), status: json["status"]);
  }
}

class DataSearchModel {
  // int? current_page;
  List<ProductSearchModel> data = [];
  DataSearchModel.fromJson(Map json) {
    // current_page = json["current_page"];
    json["data"].forEach((element) {
      data.add(ProductSearchModel.fromJson(element));
    });
  }
}

class ProductSearchModel {
  int id;
  dynamic price;
  String image;
  String name;
  bool in_favorites;
  ProductSearchModel({
    required this.id,
    required this.image,
    required this.name,
    required this.in_favorites,
    required this.price,
  });
  factory ProductSearchModel.fromJson(Map json) {
    return ProductSearchModel(
        id: json["id"],
        in_favorites: json["in_favorites"],
        image: json["image"],
        name: json["name"],
        price: json["price"]);
  }
}
