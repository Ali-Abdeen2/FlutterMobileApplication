import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationCard.dart';

import '../../core/constatnt/imageAsset.dart';

class StudentNotification extends StatelessWidget {
  const StudentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset("${ImageAsset.backArrow}")),
              title:  Text(
                "الاشعارات",
                style: TextStyle(color: Colors.black, fontSize: 20,
                fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body:GetBuilder<NotificationController>(
              init: NotificationController(),
              builder: (controller) {
                
                return
                RefreshIndicator(child: 
                ListView(
              children: [
                Column(
                  children: controller.ErrorMessage!=""?
                  [
                    Center(
                      child: Text("${controller.ErrorMessage}"),
                    )
                  ]:
                  controller.StatusRequestGetNoti==statusRequest.success?
                  controller.Messages.length==0?[Center(child:Text("لا يوجد رسائل"))]:controller.Messages:
                  [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ]
                  
                )
              ],
            )
                , onRefresh: () async{
                  await controller.loadResources(true);
                },
                );
                  
              },
            )
            ,
            backgroundColor: ColorsApp.backgroundColor,
            );
      },
    );
  }
}
