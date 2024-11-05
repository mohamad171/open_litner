import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_litner/controllers/LoginController.dart';

import '../constants/strings.dart';

class Wordcontroller extends GetxController {

  var listOfWords = [].obs;

  void createWord(title, description) {
    var loginController = Get.find<Logincontroller>();
    Databases databases = Databases(loginController.client);
    databases.createDocument(
        databaseId: "6727dd58000c12305725",
        collectionId: "6727dd760019af0ab8a9",
        documentId: ID.unique(),
        data: {"title": "Hi", "description": "Hello world"});
  }

  void getBoxWords(int index) {
    listOfWords.clear();
    var loginController = Get.find<Logincontroller>();
    Databases database = Databases(loginController.client);
      database.listDocuments(
          databaseId: litnerDB,
          collectionId: wordCollection,
          queries: [
            Query.equal("index", [index])
          ]).then(
        (value) {
          listOfWords(value.documents);
        },
      );
    
  }
}
