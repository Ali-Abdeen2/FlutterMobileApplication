import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/LoginPageController.dart';
import 'package:hebron_university_app/controller/NewsController/NewsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/NewsDetailes_.dart';
import 'package:hebron_university_app/view/widget/News/NewsSkeletonizer.dart';
import 'package:hebron_university_app/view/widget/loginPage/NewsCard.dart';
import 'package:hebron_university_app/view/widget/loginPage/biometricButton.dart';
import 'package:hebron_university_app/view/widget/loginPage/loginButton.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/constatnt/ColorsApp.dart';

import '../widget/loginPage/TextFormFieldLoginPage.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

   MyServices services = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) {
      return
      controller.StatusRequest==statusRequest.loading?Container(color: ColorsApp.backgroundColor, child: Center( child: CircularProgressIndicator(),)):
       OrientationBuilder(
      builder: (context, orientation) {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                toolbarHeight: 80,
                title: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                bottom: TabBar(
                    splashBorderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.all(10),
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.yellow,
                    indicatorWeight: 0,
                    splashFactory: NoSplash.splashFactory,
                    indicator: BoxDecoration(
                      color: ColorsApp.selectedTabBarColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorsApp.unselectedTabBarcolor,
                          ),
                          alignment: Alignment.center,
                          width: Get.width / 2.7,
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorsApp.unselectedTabBarcolor,
                          ),
                          alignment: Alignment.center,
                          width: Get.width / 2.7,
                          child: Text(
                            "الأخبار",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
              ),
              body: Form(child: Container(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(children: [
                        Center(
                            child: Image.asset(
                          "${ImageAsset.HebronLogo}",
                          height: 130,
                        )),
                        const Center(
                          child: Text("تسجيل الدخول",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const TheFullTextFiled(
                            hint: "اسم المستخدم",
                            icon: Icon(Icons.person),
                            type: "user"),
                        const SizedBox(
                          height: 40,
                        ),
                        const TheFullTextFiled(
                            hint: "كلمة المرور",
                            icon: Icon(Icons.lock),
                            type: "password"),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.StatusRequest==statusRequest.error&&controller.showMessage==true?
                        Text("كلمة المرور او رقم الحساب غير صحيح",style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700
                        )):Text(""),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loginButton(),
                              SizedBox(
                                width: 10,
                              ),
                              biometricButton()
                            ],
                          ),
                        ),
                        // Container(
                        //   height:200,
                        //   alignment: Alignment.topLeft,
                        //   child:  PaintLoginPage2(),
                        // ),
                       
                      ]),
                    ),
                  ),
                  GetBuilder<NewsController>(
                    init: NewsController(),
                    builder: (controller)
                   {
                    return (controller.data==null)?Skeletonizer(
        enabled: true,
        child: 
     ListView(
      children: [
         NewsSkeletonizer(),
         NewsSkeletonizer(),
         NewsSkeletonizer()
      ],
     )
      ):GridView.builder(
                    itemCount: controller.data['data'].length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500, mainAxisExtent: 500),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: NewsCard(
                        index: controller.data['data'][index]['id'],
                        title: controller.data['data'][index]['articleTitle'],
                        newsText: controller.data['data'][index]['articleShortDesc'],
                        image: controller.data['data'][index]['articleImage'],
                      ),
                      onTap: () async{
                        await services.sharedPreferences.setString("newsId",controller.data['data'][index]['id'].toString());
                        Get.to(NewsDetaile(
                            
                        ));
                      },
                      );
                    },
                  );
                  },)
                ]),
              )
              ),
              backgroundColor: ColorsApp.backgroundColor,
            ));
      },
    );
    },)
    , onWillPop: () async{
      return  await showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text("Do you want to close the app "),
          actions: [
            TextButton(onPressed: () {
              exit(0);
            }, child: Text("Exit")),
            TextButton(onPressed: () {
              Get.back();
            }, child: Text("Cancel"))
          ],
        );
      },);
    },);
  }
}
