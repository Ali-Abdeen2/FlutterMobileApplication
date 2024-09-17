import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/MarksControllers/CourseMarkController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';

import '../widget/CourseMark/CourseMarkCard.dart';

class CourseMark extends StatelessWidget {
  const CourseMark({super.key});

  
  @override
  Widget build(BuildContext context) {
     dynamic para=Get.parameters;
    print("_+_+_+_+_+_+_+_+");
    print(para);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("${para['termName']}",style: TextStyle(color: ColorsApp.titleColor,fontWeight: FontWeight.w900)),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("${ImageAsset.backArrow}"),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body:GetBuilder<CourseMarkController>(
        init: CourseMarkController(),
        builder: (controller) {
          return
          controller.StatusRequest==statusRequest.noContent?
          Center(child: Text("لا يوجد اي بيانات "),)
                  : controller.isConnected == true
                      ?
         SingleChildScrollView(
        child:
         Column(
        children: [
          Text(
        '${controller.CourseFile['courseName']}',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),textAlign: TextAlign.center,
          ),
          Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20,
          childAspectRatio: 0.60,
          
          children: [
              CourseMarkCard(title: "امتحان ثالث",mark:controller.CourseFile['third']==null?"":"(${controller.CourseFile['third']})", max: controller.CourseFile['thirdPerc']==null?"":"%${controller.CourseFile['thirdPerc']}",),
              CourseMarkCard(title: "امتحان ثان",mark: controller.CourseFile['second']==null?"":"(${controller.CourseFile['second']})", max:controller.CourseFile['secondPerc']==null?"":"%${controller.CourseFile['secondPerc']}",),
              CourseMarkCard(title: "امتحان اول",mark: controller.CourseFile['first']==null?"":"(${controller.CourseFile['first']})", max: controller.CourseFile['firstPerc']==null?"":"%${controller.CourseFile['firstPerc']}",),
              CourseMarkCard(title: "الامتحان النهائي",mark: controller.CourseFile['final']==null?"":"(${controller.CourseFile['final']})", max: controller.CourseFile['finalPerc']==null?"":"%${controller.CourseFile['finalPerc']}",),
              CourseMarkCard(title: "المشاركة",mark: controller.CourseFile['participation']==null?"":"(${controller.CourseFile['participation']})", max: controller.CourseFile['partPerc']==null?"":"%${controller.CourseFile['partPerc']}",),
              CourseMarkCard(title: "ابحاث",mark: controller.CourseFile['research']==null?"":"(${controller.CourseFile['research']})", max:  controller.CourseFile['researchPerc']==null?"":"%${controller.CourseFile['researchPerc']}",),
              Text(""),
              CourseMarkCard(title: "المجموع",mark: "${para['Total']}", max: "%100",),
              Text(""),
          ],
        ),
          ),
        ],
      ),
      ):
      controller.StatusRequest==statusRequest.loading?
Center(
         child: CircularProgressIndicator(),
      )
      :Center(
        child: Text(" حدث خطأ في جلب البيانات"),
      );
      }
      ,)
,
      backgroundColor: ColorsApp.backgroundColor,
    );
  }
}