import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/view/widget/GradeFile/GradeFileCard.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';

import '../../controller/MarksControllers/MarksController.dart';
import '../../core/constatnt/imageAsset.dart';

class GradeFile extends StatelessWidget {
  const GradeFile({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GetBuilder<MarksFileController>(
          init: MarksFileController(),
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
                    icon: NotificationButton(),
                    color: Colors.red,
                  )
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  "ملف العلامات",
                  style: TextStyle(
                      color: ColorsApp.titleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              body:
                  controller.services.sharedPreferences.getBool("MarksData") !=
                          true
                      ? CircularProgressIndicator()
                      : controller.isConnected == true
                          ? ListView.builder(
                              itemCount: controller.MarksFile.length,
                              itemBuilder: (context, index) {
                                return GradeFileCard(
                                  index: index,
                                  data: controller.MarksFile,
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
// import 'package:hebron_university_app/view/widget/GradeFile/GradeFileCard.dart';

// class GradeFile extends StatelessWidget {
//   const GradeFile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//     OrientationBuilder(builder: (context, orientation) {
//       return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon:Image.asset("${ImageAsset.backArrow}"),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text("ملف العلامات",style: TextStyle(color: ColorsApp.titleColor,fontSize: 20,fontWeight: FontWeight.w700),),
//         centerTitle: true,
//         elevation: 0,

//       ),
//       body: const SingleChildScrollView(
//         child: Column(
//           children: [
//               GradeFileCard(Grade: 60,),
//               GradeFileCard(Grade: 40,),
//                GradeFileCard(Grade:7.1,),
//                 GradeFileCard(Grade: 90,)
//           ],
//         ),
//       ),
//       backgroundColor: ColorsApp.backgroundColor,
//     );
//     },
//     );
    
//   }
// }