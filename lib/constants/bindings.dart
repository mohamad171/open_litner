
import 'package:get/get.dart';
import 'package:open_litner/controllers/HomeController.dart';
import '../controllers/LoginController.dart';




class OpenLitnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Logincontroller());
    Get.put(HomeController());
  }
}