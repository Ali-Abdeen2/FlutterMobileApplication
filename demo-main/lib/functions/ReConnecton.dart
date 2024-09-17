import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/LoginPageController.dart';
import '../services/services.dart';

Future ReConnection () async
{
  print("re connection ");
  MyServices services=Get.find();
  if(services.sharedPreferences.getString("username")!=null)
  {
LoginPageController  testController=Get.put(LoginPageController());
//  print(services.sharedPreferences.getString("password"));

 print(await services.sharedPreferences.getString("token"));
  
  await testController.PostLogin(services.sharedPreferences.getString("username"), services.sharedPreferences.getString("password"),false,false);
  print(" the token 2________________________________________");
  print(await services.sharedPreferences.getString("token"));
  
  }
  
   


// print("end");
}