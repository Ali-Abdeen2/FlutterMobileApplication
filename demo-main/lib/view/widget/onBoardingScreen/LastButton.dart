import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/services/services.dart';

class LastButton extends StatelessWidget {
  const LastButton({super.key, this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    MyServices services=Get.find();
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTapDown: (value) {
        controller.next();
        //  print("the Next");
        services.sharedPreferences.setBool("OnBoarding", true);
        Get.offNamed("/login");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF74978E),
                // Color(0xFFBDC7C4),
                Color.fromARGB(255, 194, 204, 201),
                Color(0xFFD9D9D9),
                Color.fromARGB(255, 251, 251, 251),
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            )),
        child: Text("تم",
            style: TextStyle(
                color: ColorsApp.OnBoardingTextButtonsColor,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
