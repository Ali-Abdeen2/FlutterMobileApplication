import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/controller/profileController/profileController.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';

import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';
import '../../data/datasource/static/static.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    NotificationController notificationController=Get.put(NotificationController());
    
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    print("the height ${Get.height}");
    print("the width ${Get.width}");
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return Scaffold(
                key: scaffolKey,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: Get.height < 600 ? 40 : 80,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed("/Notification");
                      },
                      icon:
                      NotificationButton()
                       
                    ),
                    
                  ],
                  leading: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Image.asset("${ImageAsset.IconMenu}"),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
                drawer: Drawer(
                  child: ListView.builder(
                    itemCount: MenuList.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                color: ColorsApp.OnBoardingPaint,
                              ),
                              currentAccountPicture: Container(
                                width: double.infinity,
                                child: CircleAvatar(
                                  backgroundColor: ColorsApp.backgroundColor,
                                  child: Text(
                                      "${controller.services.sharedPreferences.getString('name').toString().split(" ")[0][0]}",
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                      ),
                                ),
                              ),
                              accountEmail: Text(""),
                              accountName: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  style: TextStyle(
                                        color: Colors.black
                                      ),
                                  "${controller.services.sharedPreferences.getString('name')}",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            )
                          : 
                               Column(
                                children: [
                                InkWell(
                                  child: ListTile(
                                  trailing:
                                       Text("${MenuList[index - 1].title}"),
                                        
                                      )
                                      ,
                                      onTap: () async{
                                        if (MenuList[index - 1].title.toString() ==
                                    "تسجيل الخروج") {
                                  MyServices services = Get.find();

                                  try {
                                    String? username = await services
                                        .sharedPreferences
                                        .getString("AuthUsername");
                                    String? password = await services
                                        .sharedPreferences
                                        .getString("AuthPassword");

                                    for (var i = 0;
                                        i <
                                            services.sharedPreferences
                                                .getKeys()
                                                .length;
                                        i++) {
                                      print(services.sharedPreferences
                                          .getKeys()
                                          .elementAt(i));
                                    }
                                    await services.sharedPreferences.clear();
                                    await services.sharedPreferences
                                        .setBool("OnBoarding", true);
                                    await services.sharedPreferences.setString(
                                        "AuthUsername", username.toString());
                                    await services.sharedPreferences.setString(
                                        "AuthPassword", password.toString());
                                    print("hello world");
                                  } catch (e) {
                                    print(e);
                                  }

                                  Get.offNamed("/login");
                                } else {
                                  Get.toNamed("${MenuList[index - 1].link}");
                                }
                                      },
                                      ),
                                  Divider()
                                      
                                ],
                              );
                              
                    },
                  ),
                ),
                body: SafeArea(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: controller.services.sharedPreferences
                                  .getBool("mainScreenData") !=
                              true
                          ? CircularProgressIndicator()
                          : controller.isConnected != false &&
                                  controller.profileData.length != 1
                              ? Text(
                                  "مرحباً ${controller.services.sharedPreferences.getString('name').toString().split(" ")[0]}",
                                  style: TextStyle(
                                    fontSize: Get.height < 600 ? 20 : 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              : Center(
                                  child: Text("حدث خطأ بالاتصال "),
                                ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: controller.services.sharedPreferences
                                  .getBool("mainScreenData") !=
                              true
                          ? CircularProgressIndicator()
                          : controller.isConnected != false &&
                                  controller.profileData.length != 1
                              ? Text(
                                  "${controller.services.sharedPreferences.getString('colgName')}",
                                  style: TextStyle(
                                    fontSize: Get.height < 600 ? 10 : 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.right,
                                )
                              : Center(
                                  child: Text(""),
                                ),
                    ),
                    Expanded(
                      child: Card(
                          color: ColorsApp.onBoardingBackgroundColor,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: GridView.builder(
                              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              //     crossAxisCount: 2,
                              //     childAspectRatio:0.9,
                              //     crossAxisSpacing: 16,
                              //     mainAxisSpacing: 16),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      // maxCrossAxisExtent: 300,
                                      // //childAspectRatio:  0.95,
                                      // crossAxisSpacing: 14,
                                      // mainAxisExtent: 200,
                                      // mainAxisSpacing: 14
                                      crossAxisSpacing: 13,
                                      maxCrossAxisExtent: 180,
                                      mainAxisExtent: 180,
                                      mainAxisSpacing: 10),
                              itemCount: MenuList.length - 1,
                              itemBuilder: (context, index) {
                                final textScaleFactor =
                                    MediaQuery.of(context).textScaleFactor;
                                return Card(
                                  color: ColorsApp.OnBoardingPaint,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  elevation: 10,
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(40),
                                      onTap: () async {
                                        Get.toNamed("${MenuList[index].link}");
                                      },
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Image.asset("${MenuList[index].icon}",
                                              fit: BoxFit.fill),
                                          Text(
                                            "${MenuList[index].title}",
                                            style: TextStyle(
                                              fontSize: textScaleFactor >= 2
                                                  ? 10
                                                  : textScaleFactor > 1.45
                                                      ? 12
                                                      : 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
                          )),
                    ),
                  ],
                )),
                backgroundColor: ColorsApp.OnBoardingPaint,
              );
            },
          );
        });
  }
}
