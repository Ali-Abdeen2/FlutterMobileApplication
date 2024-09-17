import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/services/services.dart';

class MiddleWareOnBoarding extends GetMiddleware
{
  MyServices services=Get.find();

  RouteSettings? redirect(String? route)
  {

      if(services.sharedPreferences.getBool("OnBoarding")==true)
      {
        print("watched");
        return RouteSettings(
          name: "/login"
        );
      }
  }
}