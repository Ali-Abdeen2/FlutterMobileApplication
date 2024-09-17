import 'dart:convert';

import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class MarksTermController extends GetxController {
  Requests testData = Requests(Get.find());
  MyServices services = Get.find();
  late statusRequest StatusRequest;
  dynamic MarksTermFile;
  bool isConnected = false;
  
  get_data() async {
    
    services.sharedPreferences.setBool("MarksTermData", false);
    if (services.sharedPreferences.getBool("MarksTermData") != true) {
      
      var response = await testData.get_Data_MarksTerm_GET(services.sharedPreferences.getString("Mark_Url"));
      StatusRequest = handlingData(response);
      print(response);
      if (StatusRequest == statusRequest.success) {
        MarksTermFile = await response;
        MarksTermFile = jsonEncode(MarksTermFile);
        services.sharedPreferences.setString("MarksTermFile", MarksTermFile);
        services.sharedPreferences.setBool("MarksTermData", true);
        isConnected = true;
      } else {
        isConnected = false;
        MarksTermFile.add(404);
        StatusRequest = statusRequest.success;
      }
    } else {
      print("2222222222");
      isConnected = true;
    }
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    StatusRequest = statusRequest.success;
    MarksTermFile = [];
    await get_data();

    MarksTermFile = jsonDecode(
        services.sharedPreferences.getString("MarksTermFile").toString());

    super.onInit();
    update();
  }
}
 

// class MarksTermController extends GetxController {
//   Requests testData = Requests(Get.find());
//   MyServices services = Get.find();
//   late statusRequest StatusRequest;

//   dynamic MarksTermFile;
//   bool isConnected = false;

//   get_data(String termName) async {
//     if (services.sharedPreferences.getBool("MarksTermData") != true) {
//       var response = await testData.get_Data_MarksTerm_Plan_GET(termName: termName);
//       StatusRequest = handlingData(response);

//       if (StatusRequest == statusRequest.success) {
//         MarksTermFile = await response;
//         MarksTermFile = jsonEncode(MarksTermFile);
//         services.sharedPreferences.setString("MarksTermFile", MarksTermFile);
//         services.sharedPreferences.setBool("MarksTermData", true);
//         isConnected = true;
//       } else {
//         isConnected = false;
//         MarksTermFile.add(404);
//         StatusRequest = statusRequest.success;
//       }
//     } else {
//       isConnected = true;
//     }

//     update();
//   }
// @override
// void onInit() async {
//   StatusRequest = statusRequest.success;
//   MarksTermFile = [];

//   // String termName = Get.arguments ?? "";

//   await get_data();

//   MarksTermFile = jsonDecode(
//       services.sharedPreferences.getString("MarksTermFile").toString());

//   super.onInit();
//   update();
// }

// }
