import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:open_litner/constants/strings.dart';

class HomeController extends GetxController{
Client client = Client();
Databases? database;
var box0 = 0.obs;
var box1 = 0.obs;
var box2 = 0.obs;
var box3 = 0.obs;
var box4 = 0.obs;
var archive = 0.obs;


void getBoxWordsCount(int index){
  if(database != null){
    database!.listDocuments(databaseId: litnerDB, collectionId: wordCollection,queries: [
      Query.equal("index", [index])
    ]).then((value) {
      switch(index){
        case -1:
          archive(value.total);
        case 0:
          box0(value.total);
          break;
        case 1:
          box1(value.total);
          break;
        case 2:
          box2(value.total);
          break;
        case 3:
          box3(value.total);
          break;
        case 4:
          box4(value.total);
          break;
      }
    },);

  }

}


@override
  void onInit() {
    client.setProject('6727dd3300229057a75f');
    database = Databases(client);
    super.onInit();
  }

}