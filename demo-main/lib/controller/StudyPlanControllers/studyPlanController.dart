import 'dart:convert';

import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class StudyPlanController extends GetxController {
  Requests testData = Requests(Get.find());
  MyServices services = Get.find();
  late statusRequest StatusRequest;

  dynamic StudyData;
  bool isConnected = false;
  get_data() async {
    if (services.sharedPreferences.getBool("studyPlanData") != true) {
      var response = await testData.get_Data_Study_Plan_GET();
      StatusRequest = handlingData(response);

      if (StatusRequest == statusRequest.success) {
        StudyData = await response;
        StudyData = jsonEncode(StudyData);
        services.sharedPreferences.setString("StudyData", StudyData);
        services.sharedPreferences.setBool("studyPlanData", true);
        isConnected = true;
      } else {
        isConnected = false;
        StudyData.add(404);
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
    StudyData = [];

    await get_data();

    StudyData = jsonDecode(
        services.sharedPreferences.getString("StudyData").toString());

    super.onInit();
    update();
  }
}
