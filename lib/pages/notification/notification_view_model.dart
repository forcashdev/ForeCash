import 'mobile_notification_page.dart';

class NotificationModel{
  MobileNotificationPageState state;

  NotificationModel(this.state){
    this.state = state;
    // onListenScrollController();
  }

  // void onListenScrollController(){
  //     state.scrollController.addListener(() {
  //       if (state.scrollController.offset >= state.scrollController.position.maxScrollExtent &&
  //           !state.scrollController.position.outOfRange) {
  //         state.setState(() => state.showViewAll = true);
  //       }
  //     });
  // }
}