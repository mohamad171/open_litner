import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_litner/controllers/LoginController.dart';

import '../constants/strings.dart';
import '../constants/utils.dart';

class Wordcontroller extends GetxController {

  var listOfWords = [].obs;
  RxInt boxNumber = 6.obs;
  RxBool addWordLoading = false.obs;

  TextEditingController wordEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();


  void createWord(title, description) {
    var loginController = Get.find<Logincontroller>();
    addWordLoading(true);
    Databases databases = Databases(Get.find<Logincontroller>().client);
    if(boxNumber.value != 6){
      databases.createDocument(
        databaseId: litnerDB,
        collectionId: wordCollection,
        documentId: ID.unique(),
        data: {"title": title, "description": description,"index":boxNumber.value,"user_id":loginController.user!.$id}).then((value) {
          addWordLoading(false);
          wordEditingController.clear();
          descriptionEditingController.clear();
          Get.back();
          getBoxWords(boxNumber.value);
        },);
      
    }
    
  }

  void getBoxWords(int index) {
    listOfWords.clear();
    var loginController = Get.find<Logincontroller>();
    Databases database = Databases(loginController.client);
      database.listDocuments(
          databaseId: litnerDB,
          collectionId: wordCollection,
          queries: [
            Query.equal("index", [index]),
            Query.equal("user_id",loginController.user!.$id)
          ]).then(
        (value) {
          listOfWords(value.documents);
        },
      );
    
  }
  void removeWord(wordId){
    var loginController = Get.find<Logincontroller>();
    Databases databases = Databases(loginController.client);
    databases.deleteDocument(databaseId: litnerDB, collectionId: wordCollection, documentId: wordId).then((value) {
      showMessage("Word removed successful", Get.context);
      getBoxWords(boxNumber.value);
      Get.back();
    },);

  }
  void correctWord(wordId){
    var loginController = Get.find<Logincontroller>();
    Databases databases = Databases(loginController.client);
    databases.updateDocument(databaseId: litnerDB, collectionId: wordCollection, documentId: wordId,data: {"index":boxNumber.value +1}).then((value) {
      showMessage("Ok, Word moved to next home", Get.context);
      getBoxWords(boxNumber.value);
    },);
    
    

  }

  void inCorrectWord(wordId){
    var loginController = Get.find<Logincontroller>();
    Databases databases = Databases(loginController.client);
    databases.updateDocument(databaseId: litnerDB, collectionId: wordCollection, documentId: wordId,data: {"index":0}).then((value) {
      showMessage('Oh! Sorry, Word moved to first home.', Get.context);
      getBoxWords(boxNumber.value);
    },);
    

  }


}
