// To parse this JSON data, do
//
//     final forgotPasswordModal = forgotPasswordModalFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModal forgotPasswordModalFromJson(String str) => ForgotPasswordModal.fromJson(json.decode(str));

String forgotPasswordModalToJson(ForgotPasswordModal data) => json.encode(data.toJson());

class ForgotPasswordModal {
  ForgotPasswordModal({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory ForgotPasswordModal.fromJson(Map<String, dynamic> json) => ForgotPasswordModal(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.email,
  });

  String? email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
