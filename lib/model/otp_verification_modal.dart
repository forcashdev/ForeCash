// To parse this JSON data, do
//
//     final otpVerificationModal = otpVerificationModalFromJson(jsonString);

import 'dart:convert';

OtpVerificationModal otpVerificationModalFromJson(String str) => OtpVerificationModal.fromJson(json.decode(str));

String otpVerificationModalToJson(OtpVerificationModal data) => json.encode(data.toJson());

class OtpVerificationModal {
  OtpVerificationModal({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory OtpVerificationModal.fromJson(Map<String, dynamic> json) => OtpVerificationModal(
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
