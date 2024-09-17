import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:hebron_university_app/view/widget/StudyPlanSchedule/StudyPlanScheduleRows.dart';

class StudyPlanSchedule extends StatelessWidget {
  const StudyPlanSchedule({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Text(
              "${data['planMajTypeName']}",
              style:  TextStyle(
               
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed("/Notification");
                    },
                    icon: NotificationButton(),
                    color: Colors.red,
                  )
                ],
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("${ImageAsset.backArrow}"),
            ),
          ),
          body: ListView.builder(
            itemCount: data['groupsList'][0]['crsList'].length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? StudyPlanScheduleTitleRow()
                  : StudyPlanScheduleRow(
                      crsName: data['groupsList'][0]['crsList'][index - 1]
                              ['crsName']
                          .toString(),
                      crsNo: data['groupsList'][0]['crsList'][index - 1]
                          ['crsNo'],
                      planCrsCrdHours: data['groupsList'][0]['crsList']
                          [index - 1]['planCrsCrdHours'],
                      crsStatus: data['groupsList'][0]['crsList'][index - 1]
                          ['crsStatus'],
                      isPassed: data['groupsList'][0]['crsList'][index - 1]
                          ['crsNotes'],
                    );
            },
          ),
          backgroundColor: ColorsApp.onBoardingBackgroundColor,
        );
      },
    );
  }
}
