class ShopLoginModel {
  bool status;
  String message;
  UserData? data;
  ShopLoginModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory ShopLoginModel.fromJson(Map<dynamic, dynamic> json) {
    return ShopLoginModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] != null ? UserData.fromJson(json["data"]) : null,
    );
  }
}

class UserData { 
  int id;
  String name;
  String email;
  String image;
  String phone;
  int points;
  int credit;
  String token;
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      points: json["points"],
      credit: json["credit"],
      token: json["token"],
    );
  }
}
