import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/scheduleLectureControllers/scheduleLectureController.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../widget/scheduleLecture/scheduleLectureCard.dart';

class ScheduleLecture extends StatelessWidget {
  const ScheduleLecture({super.key, required this.canBack});
  final canBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Get.height > 500 ? 100 : 45,
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
        centerTitle: true,
        title: const Text(
          "برنامج المحاضرات",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: canBack == true
            ? IconButton(
                onPressed: () {
                  Get.toNamed("home");
                },
                icon: Image.asset("${ImageAsset.backArrow}"))
            : Text(""),
        actions: [
           IconButton(
                      onPressed: () {
                        Get.toNamed("/Notification");
                      },
                      icon:NotificationButton()
                      
                      
                       
                    )
        ],
        
        
      ),
      // Icon(Icons.arrow_back, color: Colors.black),

      body: GetBuilder<ScheduleLectureController>(
        init: ScheduleLectureController(),
        builder: (controller) {
          return RefreshIndicator(
            child: scheduleLectureCard(),
            onRefresh: () async {
              await controller.loadResources(true);
            },
          );
        },
      ),

      // bottomNavigationBar: MainNavigation(),
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
      // bottomNavigationBar: const bottomNavigationBar(),
    );
  }
}
