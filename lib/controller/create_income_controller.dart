import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/controller/screen_index_controller.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

import 'get_income_controller.dart';

class CreateIncomeController extends GetxController {
  final getIncomeController = Get.put(GetIncomeController());
  static CreateIncomeController get to => Get.find();
  Future createIncome({parameter, int? screenIndex, String? url}) async {
    var response;
    await Api().call(
        // isHideLoader: false,
        // isProgressShow: false,
        url: url ?? mUpsertIncome,
        params: parameter,
        success: (data) {
          print('>>>>>>>>>>>>>>');
          print('<<<<<<<<<<<<<<<<<<<${data['success'].toString()}');
          if (data['success'] == true) {
            response = data;
            final screenIndexController = Get.put(ScreenIndexController());
            screenIndex != null ? screenIndexController.updateIndex(index: screenIndex) : null;
            // screenIndexController.updateIndex(index: screenIndex ?? screenIndexController.screensIndexes);
            // GetIncomeController.to.monthlyIncomeList?.clear();
          }
        });
    return response;
    // }
  }
}
