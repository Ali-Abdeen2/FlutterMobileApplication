import 'dart:convert';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class MarksFileController extends GetxController {
  Requests testData = Requests(Get.find());
  MyServices services = Get.find();
  late statusRequest StatusRequest;

  dynamic MarksFile;
  bool isConnected = false;
  get_data() async {

    if (services.sharedPreferences.getBool("MarksData") != true) {
      var response = await testData.get_Data_Marks_GET();
      StatusRequest = handlingData(response);

      if (StatusRequest == statusRequest.success) {
        MarksFile = await response;
        MarksFile = jsonEncode(MarksFile);
        services.sharedPreferences.setString("MarksFile", MarksFile);
        services.sharedPreferences.setBool("MarksData", true);
        isConnected = true;
      } else {
        isConnected = false;
        MarksFile.add(404);
        StatusRequest = statusRequest.success;
      }
    } else {
      isConnected = true;
    }

    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    StatusRequest = statusRequest.success;
    MarksFile = [];

    await get_data();

    MarksFile = jsonDecode(
        services.sharedPreferences.getString("MarksFile").toString());

    super.onInit();
    update();
  }
}
