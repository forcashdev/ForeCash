// To parse this JSON data, do
//
//     final resetPasswordModal = resetPasswordModalFromJson(jsonString);

import 'dart:convert';

ResetPasswordModal resetPasswordModalFromJson(String str) => ResetPasswordModal.fromJson(json.decode(str));

String resetPasswordModalToJson(ResetPasswordModal data) => json.encode(data.toJson());

class ResetPasswordModal {
  ResetPasswordModal({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory ResetPasswordModal.fromJson(Map<String, dynamic> json) => ResetPasswordModal(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
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
