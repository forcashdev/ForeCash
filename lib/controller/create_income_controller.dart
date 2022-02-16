import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/getx/screen_index_controller.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

import 'get_income_controller.dart';

class CreateIncomeController extends GetxController {
  final getIncomeController = Get.put(GetIncomeController());
  static CreateIncomeController get to => Get.find();
  // Api api = Api();
  createIncome({parameter, int? screenIndex}) {
    Api().call(
        // isHideLoader: false,
        // isProgressShow: false,
        url: mAddIncome,
        params: parameter,
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
            screenIndexController.updateIndex(index: screenIndex ?? screenIndexController.screensIndexes);
          }
        });

    // }
  }
}
