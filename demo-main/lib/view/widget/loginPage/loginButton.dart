import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/LoginPageController.dart';
import 'package:hebron_university_app/controller/loginPageController/TextFormFieldUserController.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constatnt/ColorsApp.dart';

class loginButton extends StatelessWidget {
  const loginButton({super.key});
  @override
  Widget build(BuildContext context) {
    TextFormFieldUserController textFormFieldUserController =
        Get.put(TextFormFieldUserController());
    MyServices myServices = Get.find();
    return
    GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // maximumSize: Size(300, 37),
          // minimumSize: Size(170, 37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          elevation: 0,
          backgroundColor: ColorsApp.LoginButtonColors,
          padding: const EdgeInsets.symmetric(
              horizontal: 60), //specify the button's Padding
        ),
        onPressed: () async{



          
          print("the user ${textFormFieldUserController.userName}");
          print("the password ${textFormFieldUserController.password}");
          controller.PostLogin(textFormFieldUserController.userName,textFormFieldUserController.password,true,true);
          
           // print(controller.Data);

          // myServices.sharedPreferences
          //     .setString("name", textFormFieldUserController.userName);
           
        },
        child: Text(
          "دخول",
          style: TextStyle(color: Colors.black),
        ));
    },
    );
     
  }
}
