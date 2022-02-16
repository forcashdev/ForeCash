class LoginModel {
  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  LoginModel.fromJson(dynamic json) {
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
    this.token,
  });

  DataModel.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }
}
