import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/checkinternet.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class NewsPageController extends GetxController {



Requests requests = Requests(Get.find());
  late statusRequest StatusRequest;
  MyServices services = Get.find();
  late bool connection=false;
  var response;
  getDataById() async
  {
    print(services.sharedPreferences.getString("newsId"));
     response = await requests.get_News_by_id_GET(services.sharedPreferences.getString("newsId"));
      StatusRequest = handlingData(response);
      if (StatusRequest == statusRequest.success) {
        print("+++++++++++++++++++++++++++++++++++++++");
        print(response['data']);
        print("+++++++++++++++++++++++++++++++++++++++");
      }
  }
  

  @override
  void onInit() async{
    // TODO: implement onInit
   await getDataById();
    update();
  }
}
