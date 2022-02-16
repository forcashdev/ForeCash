class RegisterModel {
  RegisterModel({
    this.success,
    this.message,
    this.data,
  });

  RegisterModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  DataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DataModel {
  DataModel({
    this.user,
    this.token,
  });

  DataModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.v,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? email;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['__v'] = v;
    return map;
  }
}
