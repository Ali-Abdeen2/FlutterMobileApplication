import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/StudyPlanControllers/studyPlanController.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:hebron_university_app/view/widget/StudyPlan/StudyPlanCard.dart';

import '../../core/constatnt/imageAsset.dart';

class StudyPlan extends StatelessWidget {
  const StudyPlan({super.key,required this.canBack});
  final canBack;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GetBuilder<StudyPlanController>(
          init: StudyPlanController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 100,
                leading:canBack==true? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset("${ImageAsset.backArrow}")
                ):Text(""),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed("/Notification");
                    },
                    icon: NotificationButton(),
                    color: Colors.red,
                  )
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  "الخطة الدراسية",
                  style: TextStyle(
                      color: ColorsApp.titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              body: controller.services.sharedPreferences
                          .getBool("studyPlanData") !=
                      true
                  ? Center(
                    child: CircularProgressIndicator(),
                  )
                  : controller.isConnected == true
                      ? ListView.builder(
                          itemCount: controller.StudyData.length,
                          itemBuilder: (context, index) {
                            return StudyPlanCard(
                              index: index,
                              data: controller.StudyData,
                            );
                          },
                        )
                      : Center(
                        
                          child: Text("هناك خطأ بالاتصال"),
                        ),
              backgroundColor: ColorsApp.onBoardingBackgroundColor,
            );
          },
        );
      },
    );
  }
}
