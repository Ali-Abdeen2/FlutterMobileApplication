import 'dart:convert';

import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class CourseMarkController extends GetxController {
  Requests testData = Requests(Get.find());
  MyServices services = Get.find();
  late statusRequest StatusRequest;
  dynamic CourseFile;
  bool isConnected = false;
  bool noContent=false;
  get_data() async {
    services.sharedPreferences.setBool("MarksTermData", false);
    if (services.sharedPreferences.getBool("MarksTermData") != true) {
      
      var response = await testData.get_Data_CourseFile_GET("${services.sharedPreferences.getString("Mark_Url")}/${services.sharedPreferences.getString("Course_Url")}");
      StatusRequest = handlingData(response);
      print(response);
      if (StatusRequest == statusRequest.success) {
        CourseFile = await response;
        CourseFile = jsonEncode(CourseFile);
        services.sharedPreferences.setString("CourseFile", CourseFile);
        services.sharedPreferences.setBool("CourseFileData", true);
        isConnected = true;
      }
      else if(StatusRequest == statusRequest.noContent)
      {
        noContent=true;
      }
       else {
        isConnected = false;
        CourseFile.add(404);
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
    StatusRequest = statusRequest.loading;
    CourseFile = [];
    await get_data();

    CourseFile = jsonDecode(
        services.sharedPreferences.getString("CourseFile").toString());

    super.onInit();
    update();
  }
}
