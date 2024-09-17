import 'dart:developer';

import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../data/datasource/remote/Requests.dart';
import '../../functions/handlingData.dart';
import '../../services/services.dart';

class ProfileController extends GetxController
{
  Requests requests =Requests(Get.find());
  late statusRequest StatusRequest;
  MyServices services=Get.find();
  //late Map profileData;
  dynamic profileData;
  bool isConnected =false;
  getData() async
  {

    if(services.sharedPreferences.getBool("mainScreenData")!=true)
    {
       var response=await requests.get_Data_Profile_GET();
    StatusRequest=handlingData(response);
    if(StatusRequest==statusRequest.success)
    {
      profileData= await response;
      isConnected=true;
      services.sharedPreferences.setBool("mainScreenData", true);
      services.sharedPreferences.setString("name", profileData['name']);
      services.sharedPreferences.setString("specName", profileData['specName']);
      services.sharedPreferences.setString("certName", profileData['certName']);
      services.sharedPreferences.setString("colgName", profileData['colgName']);
      services.sharedPreferences.setString("academicSupervisorName", profileData['academicSupervisorName']);


      
    }
    else
    {
      isConnected=false;
      profileData['404']=true;
    }

    }
    else
    {
      isConnected=true;
    }
   
   
   update();
    
  }
  @override
  void onInit() {
    // TODO: implement onInit
    print("${services.sharedPreferences.getBool('mainScreenData')}");
    print("the profile controller init");
    profileData={};
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("close ");
    super.onClose();
  }
}