import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constatnt/ColorsApp.dart';

class semesterWithdrawal extends StatelessWidget {
  const semesterWithdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
        centerTitle: true,
        title: const Text(
          "نموذج طلب",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.black))
        ],
      ),
      body: Container(
        height: double.infinity,
        color: ColorsApp.onBoardingBackgroundColor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(": اسم الطالب / ة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("تبيان محمد نعمان علي الحرباوي",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(": الرقم الجامعي",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("22011417",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(": القسم",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("تكنولوجيا الويب والوسائط المتعددة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(": عدد الساعات المسجلة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("9",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(": سبب سحب الفصل",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 50, // when user presses enter it will adapt to it
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(121, 243, 237, 237),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Adjust the radius as needed
                      borderSide: BorderSide(),
                    ),
                    hintText: "السبب   ",
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.symmetric(vertical: 40)),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("إرسال",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold)))),
            ],
          ),
        ),
      ),
    );
  }
}
