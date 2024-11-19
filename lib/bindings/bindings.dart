import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/controller/bottomnav_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DhasboardController());
  }
}