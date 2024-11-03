
import 'package:get/get.dart';
import 'package:open_litner/controllers/HomeController.dart';
import '../controllers/MainController.dart';




class OpenLitnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
  }
}