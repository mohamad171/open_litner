import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
Client client = Client();


@override
  void onInit() {
    client.setProject('6727dd3300229057a75f');
    super.onInit();
  }

}