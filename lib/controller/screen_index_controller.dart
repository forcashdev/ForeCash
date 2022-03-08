import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScreenIndexController extends GetxController {
  GetStorage screensIndexes = GetStorage();
  // int? screensIndexes = 0;
  void updateIndex({int? index}) {
    screensIndexes.write('index', index);
    // screensIndexes = index;
    print(':::::::::${screensIndexes.read('index')}');
    update();
  }

  @override
  void dispose() {
    super.dispose();
    screensIndexes.remove('index');
  }
}
