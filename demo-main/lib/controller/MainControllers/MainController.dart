import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/functions/ReConnecton.dart';
import 'package:hebron_university_app/services/services.dart';

class MainController extends GetxController with WidgetsBindingObserver
{


MyServices services =Get.find();


@override
void dispose()
  {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    // TODO: implement didChangeAppLifecycleState

 super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.resumed)
    {
      if(services.sharedPreferences.get("token")!=null)
      {
        print((services.sharedPreferences.get("token").toString()));
        print("resumed");
      NotificationController notificationController =Get.put(NotificationController());
      await ReConnection();
      await notificationController.GetNoti();
      
      }
      
    }
    else if(state==AppLifecycleState.paused)
    {
      print("paused");
      
    }
    else if(state==AppLifecycleState.inactive)
    {
      print("inactive");
    }
    else if(state==AppLifecycleState.detached)
    {
      print("detached");
    }
   
  }



  @override
  void onInit() {
    // TODO: implement onInit


    print("Init Main Page");
    WidgetsBinding.instance.addObserver(this);
    super.onInit();

    
  }
}