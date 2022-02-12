import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class CreateIncomeController extends GetxController {
  static CreateIncomeController get to => Get.find();

  // Rx<IncomeModel> incomeModel = IncomeModel().obs;
  Api api = Api();

  // findLength() {
  //   int monthlyIncomeLength = 0;
  //   for (int i = 0; i < CreateIncomeController.to.incomeModel.value.data!.length; i++) {
  //     if (CreateIncomeController.to.incomeModel.value.data?[i].incomeOutgoing == 1 && CreateIncomeController.to.incomeModel.value.data?[i].weekMonth == 2) {
  //       monthlyIncomeLength++;
  //     }
  //   }
  //   print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>$monthlyIncomeLength');
  //   return monthlyIncomeLength;
  // }

  createIncome({parameter}) {
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
          print(data.toString());


          print('>>>>>>>>>>>>>>');
          // incomeModel.value = IncomeModel.fromJson(data);
          // incomeModel.value.toJson();

          // if (dataModel.value.success == true) {
          //   final box = GetStorage();
          //   box.write('userEmail', email);
          //   final screenIndexController = Get.put(ScreenIndexController());
          //   screenIndexController.updateIndex(index: 1);
          //   Get.to(() => const ScreenProgressIndicator());
          // }
        });

    // }
  }

  RxList<MonthlyIncomeModel> monthlyIncomesList = <MonthlyIncomeModel>[].obs;

  getMonthlyIncome() {
    monthlyIncomesList.add(
      MonthlyIncomeModel(incomeName: '', amount: '', paidOn: '1st', dateTime: DateTime.now(), every: '1 mon'),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMonthlyIncome();
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
