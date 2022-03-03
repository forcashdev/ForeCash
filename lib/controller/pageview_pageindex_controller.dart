import 'package:get/get.dart';

class PageViewPageIndex extends GetxController {
  int? pageIndex;

  updatePageIndex({int? index}) {
    pageIndex = index;
    update();
  }
}
