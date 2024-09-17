import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/HomePageControllers/bottomNavBarHomePageController.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/controller/loginPageController/TextFormFieldUserController.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/services/services.dart';
import '../../data/datasource/static/static.dart';
import '../widget/HomePage/navigationDestinationForBottomNavBar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

        
    TextFormFieldUserController textFormFieldUserController =
        Get.put(TextFormFieldUserController());
    print("the name ${textFormFieldUserController.userName}");
    bottomNavBarHomePageController bottomNavBarcontroller =
        Get.put(bottomNavBarHomePageController());

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          
          bottomNavigationBar: MainNavigation(),
          body: WillPopScope(
            onWillPop: () async {
              return await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("هل تريد تسجيل الخروج "),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            MyServices services = Get.find();
                           
                           try
                           {


                              String? username =await services.sharedPreferences
                                .getString("AuthUsername");
                            String? password =await services.sharedPreferences
                                .getString("AuthPassword");
                            
                             
                           
                          for(var i=0;i<services.sharedPreferences.getKeys().length;i++)
                          {
                            print(services.sharedPreferences.getKeys().elementAt(i));
                          }
                          await services.sharedPreferences.clear();
                           await services.sharedPreferences.setBool("OnBoarding",true);
                          await services.sharedPreferences
                                .setString("AuthUsername", username.toString());
                           await services.sharedPreferences
                                .setString("AuthPassword", password.toString());
                            print("hello world");

                           }
                           catch(e)
                           {
                              print(e);
                           }
                            
                            
                           await exit(0);
                           
                          },
                          child: Text("نعم")
                          ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("لا")
                          )
                    ],
                  );
                },
              );
            },
            child: GetBuilder<bottomNavBarHomePageController>(
              init: bottomNavBarHomePageController(),
              builder: (controller) {
                return navbarWidgets[bottomNavBarcontroller.index];
              },
            ),
          ),
          backgroundColor: ColorsApp.OnBoardingPaint,
        );
      },
    );
  }
}
