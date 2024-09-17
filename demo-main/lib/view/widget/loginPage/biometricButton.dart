import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/LoginPageController.dart';
import 'package:hebron_university_app/view/widget/loginPage/loginButton.dart';
import '../../../core/constatnt/ColorsApp.dart';

class biometricButton extends StatelessWidget {
  const biometricButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // maximumSize: Size(300, 37),
          // minimumSize: Size(170, 37),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          elevation: 0,
          backgroundColor: ColorsApp.LoginButtonColors,
          //specify the button's Padding
        ),
        onPressed: () {
          controller.biometric();
          Get.bottomSheet(
              Container(
                padding: const EdgeInsets.only(
                  top: 38,
                  left: 31,
                  right: 31,
                  bottom: 30,
                ),
                decoration: const ShapeDecoration(
                  color: Color(0xFF8CA88C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x4C000000),
                      blurRadius: 250,
                      offset: Offset(20, -50),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'يمكنك استخدام بصمة اصبعك  لتأكيد عملية تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(height: 23),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'المس مستشعر بصمة الإصبع',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // SizedBox(height: 23),
                    const SizedBox(height: 23),
                    SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.fingerprint,
                              size: 70,
                              color: Colors.white,
                            ))),
                    const SizedBox(height: 33),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'استخدام كلمة المرور',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )

                    // SizedBox(
                    //     width: double.infinity,
                    //     height: 35,
                    //     child: TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         'استخدام كلمة المرور',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 16,
                    //           fontFamily: 'Lato',
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     )),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
                // side: const BorderSide(width: 5, color: Colors.black)),
                // enableDrag: false,
              ));
        },
        child: const Icon(
          Icons.fingerprint,
          size: 30,
        ));
    },);
  }
}
