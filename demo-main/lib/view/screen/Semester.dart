import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:http/http.dart';

import '../../controller/MarksControllers/MarksTermController.dart';
import '../widget/Semester/SemesterTable.dart';

class Semester extends StatelessWidget {
  const Semester({super.key});

  @override
  Widget build(BuildContext context) {
    
   
    return OrientationBuilder(
      builder: (context, orientation) {
        return GetBuilder<MarksTermController>(
          init: MarksTermController(),
          builder: (controller) {
            
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 100,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset("${ImageAsset.backArrow}"),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed("/Notification");
                    },
                    icon:NotificationButton(),
                    color: Colors.red,
                  )
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  " ملف العلامات",
                  style: TextStyle(
                      color: ColorsApp.titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              body:
               controller.services.sharedPreferences
                          .getBool("MarksTermData") !=true
                  ? Center(
                    child: CircularProgressIndicator(),
                  )
                  : controller.isConnected == true
                      ? ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  SemesterTitleRow(),
                                  SemesterRow(
                                    index: index,
                                    data: controller.MarksTermFile,
                                  )
                                ],
                              ),
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




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
// import 'package:hebron_university_app/core/constatnt/imageAsset.dart';

// import '../widget/Semester/SemesterTable.dart';

// class Semester extends StatelessWidget {
//   const Semester({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//     OrientationBuilder(builder: (context, orientation) {
//       return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Image.asset("${ImageAsset.backArrow}"),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text("الفصل الأول 2021/2020",style: TextStyle(color: ColorsApp.GradeFileTextColor,fontWeight: FontWeight.w600),),
//       ),
      
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//            SemesterTitleRow(),
//            SemesterRow(),
//            SemesterRow(),
//            SemesterRow(),
//            SemesterRow()
//           ],
//         ),
//       ),
//       backgroundColor: ColorsApp.backgroundColor,
//     );
//     },
//     );
    
//   }
// }



