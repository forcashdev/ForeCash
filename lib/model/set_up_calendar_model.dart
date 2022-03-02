class SetUpCalendarModel {
  SetUpCalendarModel({
    this.success,
    this.message,
    this.data,
  });

  SetUpCalendarModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
  }
  bool? success;
  String? message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
