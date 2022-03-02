import 'package:fore_cash/api/api_call.dart';
import 'package:fore_cash/model/set_up_calendar_model.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/allset_screen.dart';
import 'package:get/get.dart';

class SetUpCalendarController extends GetxController {
  static SetUpCalendarController get to => Get.find();

  Rx<SetUpCalendarModel> setUpCalendarModel = SetUpCalendarModel().obs;

  callCalendar({
    String? resetWeekOn,
    String? lowBalance,
  }) {
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
          print(data);
          // setUpCalendarModel.value = SetUpCalendarModel.fromJson(data);
          //
          // setUpCalendarModel.value.toJson();
          if (data["success"] == true) {
            Get.to(const AllSetScreen());
          }
        });
    // }
  }
}
