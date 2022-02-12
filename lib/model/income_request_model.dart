import 'package:get/get_rx/src/rx_types/rx_types.dart';

class IncomeRequestModel {
  IncomeRequestModel({
    this.income,
  });

  IncomeRequestModel.fromJson(dynamic json) {
    if (json['income'] != null) {
      income = [] as RxList<Income>?;
      json['income'].forEach((v) {
        income?.add(Income.fromJson(v));
      });
    }
  }
  RxList<Income>? income;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (income != null) {
      map['income'] = income?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Income {
  Income({
    this.name,
    this.incomeOutgoing,
    this.weekMonth,
    this.paidOn,
    this.amount,
    this.date,
  });

  Income.fromJson(dynamic json) {
    name = json['name'];
    incomeOutgoing = json['income_outgoing'];
    weekMonth = json['week_month'];
    paidOn = json['paid_on'];
    amount = json['amount'];
    date = json['date'];
  }
  String? name;
  int? incomeOutgoing;
  int? weekMonth;
  int? paidOn;
  int? amount;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['income_outgoing'] = incomeOutgoing;
    map['week_month'] = weekMonth;
    map['paid_on'] = paidOn;
    map['amount'] = amount;
    map['date'] = date;
    return map;
  }
}
