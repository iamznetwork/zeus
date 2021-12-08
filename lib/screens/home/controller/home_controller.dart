import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentTabIndex = 0;

  void setCurrentTabIndex(var _index) {
    currentTabIndex = _index;
    // update();
  }
}
