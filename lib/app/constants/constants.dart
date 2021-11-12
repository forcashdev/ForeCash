
import 'package:rxdart/rxdart.dart';

var stepIndexController = BehaviorSubject<int>();
Stream<int> stepIndexStream = stepIndexController.stream;


class Constants {
  static const appName = 'ForCash';
  static const baseURL = "";

  //Api Name
  static const signInUrl = baseURL + "/user/login";

  //images
  static const img_splash = '$root_image' + 'img_splash.png';
  static const img_splash_mobile = '$root_image' + 'splash_mobile.svg';
  static const img_all_set = '$root_image' + 'img_all_set.png';
  static const img_profile = '$root_image' + 'img_profile.png';

  //icons
  static const ic_logo = '$root_icon' + 'ic_logo.png';
  static const ic_calendar = '$root_icon' + 'ic_calendar.svg';
  static const ic_logo_primary = '$root_icon' + 'ic_logo_primary.svg';
  static const ic_pass_hide = '$root_icon' + 'ic_pass_hide.svg';
  static const ic_show_password = '$root_icon' + 'ic_show_password.png';
  static const ic_search = '$root_icon' + 'ic_search.svg';
  static const ic_notification = '$root_icon' + 'ic_notification.svg';
  static const ic_warning = '$root_icon' + 'ic_warning.svg';
  static const ic_up_arrow = '$root_icon' + 'ic_up_arrow.svg';
  static const ic_down_arrow = '$root_icon' + 'ic_down_arrow.svg';
  static const ic_calender_primary = '$root_icon' + 'ic_calender_primary.svg';
  static const ic_arrow_left = '$root_icon' + 'ic_arrow_left.svg';
  static const ic_arrow_right = '$root_icon' + 'ic_arrow_right.svg';
  static const ic_edit = '$root_icon' + 'ic_edit.svg';
  static const ic_minimize = '$root_icon' + 'ic_minimize.svg';
  static const ic_accept = '$root_icon' + 'ic_accept.svg';
  static const ic_skip = '$root_icon' + 'ic_skip.svg';
  static const ic_week = '$root_icon' + 'ic_week.svg';
  static const ic_delete = '$root_icon' + 'ic_delete.svg';
  static const ic_camera = '$root_icon' + 'ic_camera.svg';
  static const ic_profile = '$root_icon' + 'ic_profile.svg';
  static const ic_credit_card = '$root_icon' + 'ic_credit_card.svg';
  static const ic_add_account = '$root_icon' + 'ic_add_account.svg';
  static const ic_setting = '$root_icon' + 'ic_setting.svg';
  static const ic_logout = '$root_icon' + 'ic_logout.svg';

  static const ic_arrow_left_full = '$root_icon' + 'ic_arrow_left_full.svg';
  static const ic_arrow_right_full = '$root_icon' + 'ic_arrow_right_full.svg';


  //images
  static const dummy_image = '$root_image' + 'dummy_image.png';


  static const root_icon = 'assets/icon/';
  static const root_image = 'assets/images/';

}
