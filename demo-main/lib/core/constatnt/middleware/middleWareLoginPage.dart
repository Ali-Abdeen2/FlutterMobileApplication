import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/LoginPageController.dart';
import 'package:hebron_university_app/services/services.dart';

class MiddleWareLoginPage extends GetMiddleware
{
  
  MyServices services=Get.find();
  LoginPageController loginPageController =Get.put(LoginPageController());
  @override
  RouteSettings? redirect(String? route)
  {
   // print("middleware the username ${services.sharedPreferences.getString("username")}");
    if(services.sharedPreferences.getString("username")!=null)
    {
      loginPageController.showMessage=false;
      if(loginPageController.PostLogin(services.sharedPreferences.getString("username"), services.sharedPreferences.getString("password"), true,false).runtimeType==Get.toNamed("/home"))
    {
      return RouteSettings(
          name: "/home"
        );
    }
    }
    else
    loginPageController.showMessage=true;
    
   
  }
}