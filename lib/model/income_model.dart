class IncomeModel {
  IncomeModel({
    this.success,
    this.message,
    this.data,
  });

  IncomeModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  bool? success;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.userId,
    this.incomeOutgoing,
    this.weekMonth,
    this.paidOn,
    this.amount,
    this.datetime,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    userId = json['userId'];
    incomeOutgoing = json['income_outgoing'];
    weekMonth = json['week_month'];
    paidOn = json['paid_on'];
    amount = json['amount'];
    datetime = json['datetime'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? userId;
  int? incomeOutgoing;
  int? weekMonth;
  int? paidOn;
  int? amount;
  String? datetime;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['userId'] = userId;
    map['income_outgoing'] = incomeOutgoing;
    map['week_month'] = weekMonth;
    map['paid_on'] = paidOn;
    map['amount'] = amount;
    map['datetime'] = datetime;
    map['__v'] = v;
    return map;
  }
}
