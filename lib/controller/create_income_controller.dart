import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/model/income_request_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class CreateIncomeController extends GetxController {
  static CreateIncomeController get to => Get.find();
  Api api = Api();
  createIncome({parameter, int? screenIndex}) {
    api.call(
        // isHideLoader: false,
        // isProgressShow: false,
        url: mAddIncome,
        params: parameter ?? null,
        // params: {
        //   rName: name,
        //   rIncomeOutgoing: 1,
        //   rWeekMonth: 2,
        //   rPaidOn: paidOn,
        //   rAmount: amount,
        //   rDate: date,
        // },
        error: () {
          // print(incomeModel.value.success);
        },
        success: (data) {
          print('>>>>>>>>>>>>>>');
          print('<<<<<<<<<<<<<<<<<<<${data['success'].toString()}');
          if (data['success'] == true) {
            final screenIndexController = Get.put(ScreenIndexController());
            screenIndexController.updateIndex(index: screenIndex);
          }
        });

    // }
  }

  RxList<MonthlyIncomeModel> IncomesList = <MonthlyIncomeModel>[].obs;

  getMonthlyIncome() {
    IncomesList.add(
      MonthlyIncomeModel(incomeName: '', amount: '', paidOn: '1st', dateTime: DateTime.now(), every: '1 mon'),
    );
  }

  RxList<Income>? monthlyIncomeList = <Income>[].obs;

  getMonthlyIncomeList() {
    monthlyIncomeList?.add(
      Income(paidOn: 5, date: DateTime.now().toString(), incomeOutgoing: 1, weekMonth: 2, every: 1, amount: 0),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMonthlyIncomeList();
  }
}

class MonthlyIncomeModel {
  String? incomeName;
  String? amount;
  String? paidOn;
  String? every;
  DateTime? dateTime;

  MonthlyIncomeModel({this.incomeName, this.amount, this.paidOn, this.every, this.dateTime});
}
