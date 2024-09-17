import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/controller/loginPageController/TextFormFieldUserController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/local_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/class/crud.dart';
import '../services/services.dart';

class LoginPageController extends GetxController
{
  bool showMessage=true;
  late Requests requests ;
  TextFormFieldUserController TextController=Get.put(TextFormFieldUserController());

  List Data=[];
  
  late statusRequest StatusRequest;
  MyServices services=Get.find();


  biometric() async
  {
    print("biometric");
    if(services.sharedPreferences.getString("AuthUsername")!=null)
    {

    final authenticate=await LocalAuth.authenticate();
    if(authenticate)
    {
      print("yes");
      PostLogin(services.sharedPreferences.getString("AuthUsername"), services.sharedPreferences.getString("AuthPassword"), true, true);
    }
    else
    {
      print("No");
    }
    }
    
  }

  //this function use for middleware login page to detrmine if the user can pass to home page 

//  Future<bool> CheckLoginPage (username,password,ThisLogin,saveTheData) async
//   {
    
//     StatusRequest =await statusRequest.loading;
//     update();
//     Map sendData={};
//     sendData['userName']=username;
//     sendData['password']=password;
    
//     print("__________________");
//     print(sendData);
//     print("__________________");
   

//     var response=await testData.get_Data_Login_Post(sendData);
//     StatusRequest=handlingData(response);
//     if(statusRequest.success==StatusRequest)
//     {

//       if(saveTheData)
//       {
//         services.sharedPreferences.setString("username", TextController.userName);
//        services.sharedPreferences.setString("password", TextController.password);
//       }
       
//       print("+++++++++++++++++++++++++++++++++++++++++++");
//       Data.add(response);
//       print(Data[0]['isSuccess']);
//       print(Data[0]['data']['accessToken']);
//      //await services.sharedPreferences.setString("token","${Data[0]['data']['accessToken']}");
//       print("+++++++++++++++++++++++++++++++++++++++++++");
//       //Get.snackbar("the connection success", "");
//       if(ThisLogin==true)
//      return  true;
//       else
//       return  false;
//     }
//     else
//     {
//       Get.snackbar("the connection did not success", "");
//       print("- - - - -- - - - - -- - - - - - - -- - - - - - -");
//       return  false;
//     }
    
    
//   }







  PostLogin(username,password,ThisLogin,saveTheData) async
  {
    
    StatusRequest =await statusRequest.loading;
    update();
    print("()()()()()()()()()()()()()()()()()()()()()()");
     
    Map sendData={};
    sendData['userName']=username;
    sendData['password']=password;
    
    print("__________________");
    print(sendData);
    print("__________________");
   

    var response=await requests.get_Data_Login_Post(sendData);
    StatusRequest=handlingData(response);
    if(statusRequest.success==StatusRequest)
    {
      NotificationController notificationController=Get.put(NotificationController());
      String NotiToken=(await FirebaseMessaging.instance.getToken()).toString();

      print("the token in login controller ${NotiToken}");
      
      await notificationController.Register(NotiToken);
      await notificationController.GetNoti();

      if(saveTheData)
      {
       services.sharedPreferences.setString("username", username);
       services.sharedPreferences.setString("password", password);
       services.sharedPreferences.setString("AuthUsername", username);
       services.sharedPreferences.setString("AuthPassword", password);
      }
      //  TextController.userName="";
      //  TextController.password="";
      //  TextController.onChangePassword("");
      //  TextController.onChangeUser("");
      //  TextController.update();
      print("+++++++++++++++++++++++++++++++++++++++++++");
      Data.add(response);
      print(Data[0]['isSuccess']);
      print(Data[0]['data']['accessToken']);
     //await services.sharedPreferences.setString("token","${Data[0]['data']['accessToken']}");
      print("+++++++++++++++++++++++++++++++++++++++++++");
      // Get.snackbar("the connection success", "");
      if(ThisLogin==true) {
        
        TextController.TextEditingControllerPassword.text="";
        TextController.TextEditingControllerUser.text="";
        TextController.userName="";
        TextController.password="";
        return Get.toNamed("/home");
      }
    }
    else
    {
      //Get.snackbar("the connection did not success", "");
      print("- - - - -- - - - - -- - - - - - - -- - - - - - -");
    }
    
    update();
  }

  @override
  void onInit() {
    
    // TODO: implement onInit
    print("the controller init");
    Get.put(Crud());
     requests =Requests(Get.find());
   // getData();
   StatusRequest=statusRequest.success;
    super.onInit();
  }
}