import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/scheduleLectureControllers/scheduleLectureController.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/scheduleLecture/scheduleLectureMainCard.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/constatnt/ColorsApp.dart';
import 'Subjects.dart';
// import 'package:hebron_university_app/view/widget/subjects.dart';

class scheduleLectureCard extends StatelessWidget {
  const scheduleLectureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleLectureController>(
      init: ScheduleLectureController(),
      builder: (controller) {
        return controller.services.sharedPreferences.getBool("scheduleLectureData")!=true&&controller.isConnected==false?Center(
          child: Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                        return index==0?scheduleLectureMainCard()
                        :subjects(
                TeacherName:"Item number  as title",
                SubjectName: "Item number  as title",
                crsTime:"Item number  as title",
                roomNo: "Item number  as title",
              );
                      },),
                    ),
          
        ):
        controller.isConnected==true?
        ListView.builder(
          itemCount: controller.ScheduleData.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                // color: ColorsApp.onBoardingBackgroundColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      scheduleLectureMainCard(),
                       const SizedBox(
                        height: 50,
                      ),
                      
                      //////////////////////////////////////////////////////////////////
                      //////////////////////////////////////////////////////////////////
                      //////////////////////////////////////////////////////////////////
                     
                    ]),
              );
            } else
              return subjects(
                TeacherName: controller.ScheduleData[index - 1]['teacherName'],
                SubjectName: controller.ScheduleData[index - 1]['courseName'],
                crsTime: controller.ScheduleData[index - 1]['crsTime'],
                roomNo: controller.ScheduleData[index - 1]['roomNo'],
              );
          },
        ):
        Center(
          child: Text("حدث خطأ بالاتصال"),
        )
        
        ;
      },
    );
  }
}
