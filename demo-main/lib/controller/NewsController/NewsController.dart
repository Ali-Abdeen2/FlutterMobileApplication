import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/checkinternet.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';

class NewsController extends GetxController {


dynamic data;
Requests requests = Requests(Get.find());
  late statusRequest StatusRequest;
  MyServices services = Get.find();
  late bool connection=false;
   checkInternetConnectivity() async {
     connection=await checkinternet();
    update();
  }

 
   getData () async
  {
    data=null;
     var response;
    print("_____________________");
     response = await requests.get_News_GET();
     
      StatusRequest = handlingData(response);
      if (StatusRequest == statusRequest.success) {
        data=response;
        print("+++++++++++++++++++++++++++++++++++++++");
        print(response['data'][0]);
      }
  }
  
  changeTheColor() {
    if (Get.width > 700) {
      print("change");
      return Colors.black;
    } else {
      return Colors.red;
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    print("init");
    print("_____________________");
   print("_____________________");
   await getData();
    update();
  }
}
