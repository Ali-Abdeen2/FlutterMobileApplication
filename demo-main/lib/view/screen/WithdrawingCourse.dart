import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/CrsDropController.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestFormController.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';

import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';
import '../widget/Requests/RequestFormCard.dart';

class WithdrawingCourse extends StatelessWidget {
  const WithdrawingCourse({super.key, required this.canBack});
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
          "نموذج سحب مساق ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
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
                      icon:NotificationButton()
                      
                      
                       
                    )
        ],
      ),
      body: GetBuilder<CrsDropController>(
        init: CrsDropController(),
        builder: (controller) {
          return RefreshIndicator(
            child: RequestFormCard(),
            onRefresh: () async {
              await controller.loadResources(true);
            },
          );
        },
      ),
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
    );
  }
}
