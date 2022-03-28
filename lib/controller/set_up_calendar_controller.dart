import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/set_up_calendar_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class SetUpCalendarController extends GetxController {
  static SetUpCalendarController get to => Get.find();

  Rx<SetUpCalendarModel> setUpCalendarModel = SetUpCalendarModel().obs;

  callCalendar({int? resetWeekOn, String? lowBalance, Function? onSuccess}) {
    Api().call(
        url: mSetUpCalendar,
        params: {
          rResetWeekOn: resetWeekOn,
          rLowBalance: lowBalance,
        },
        error: () {
          print(setUpCalendarModel.value.success);
        },
        success: (data) {
          print('>>>>>>>>$data');
          // setUpCalendarModel.value = SetUpCalendarModel.fromJson(data);
          //
          // setUpCalendarModel.value.toJson();
          if (data["success"] == true) {
            onSuccess != null ? onSuccess() : null;
            // Get.to(const AllSetScreen());
          }
        });
    // }
  }
}
