import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScreenIndexController extends GetxController {
  final PageController pageController = PageController();
  int screensIndexes = 0;
  void updateIndex({int? index}) {
    screensIndexes = index!;
    update();
  }
}
