import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RegisterController/GetAvilableCourses.dart';
import 'package:hebron_university_app/controller/RegisterController/RegisterController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/screen/CourseMark.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowspecific.dart';
import 'package:hebron_university_app/view/widget/Register/CourseTitle.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRow.dart';
import 'package:hebron_university_app/view/widget/Register/CourseTitleSpecific.dart';
import 'package:hebron_university_app/view/widget/Register/TitleLabel.dart';
import 'package:hebron_university_app/view/widget/Semester/SemesterTable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
          RegisterController RegController=Get.put(RegisterController());
          getAvailableCourses availableCourses=Get.put(getAvailableCourses());
    return
    OrientationBuilder(builder: 
    (context, orientation) {
      return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        toolbarHeight: Get.height > 500 ? 100 : 45,
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
        centerTitle: true,
        title: const Text(
         "سحب وأضافة",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset("${ImageAsset.backArrow}")),
        actions: [
           IconButton(
                      onPressed: () {
                        Get.toNamed("/Notification");
                      },
                      icon:NotificationButton()
                      
                      
                       
                    )
        ],
      ),
      body:SingleChildScrollView(
        
        child: Column(
          children: [
            TitleLabel(title: "البرنامج الدراسي")
            ,
            Divider(
              height: 20,
            ),
            Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 14),
        child:CourseTitleRow(), 
        ),
        GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: 
        (controller) {
          return Column(
          children: 
           controller.StatusRequest==statusRequest.loading?
           [
            Center(
              child: CircularProgressIndicator(),
            )
           ]:
           controller.StatusRequest==statusRequest.error?
           [
            Center(
              child: Text("حدث خطأ"),
            )
           ]:
           controller.StatusRequest==statusRequest.noContent?
           [
            Center(
              child: Text("لم يتم اختيار اي مواد بعد"),
            )
           ]:
           controller.Listreg
          
        );
        },
        )
        ,
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: GetBuilder<RegisterController>(
            builder: (controller) {
              return 
              controller.StatusRequestSave==statusRequest.loading?
              Skeletonizer(child: ElevatedButton(
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Adjust the border radius as needed
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xffCDD8C7)), // Button background color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30,vertical: 10)), // Button padding
              ),
                onPressed: () {
                
              }, child: Text(
                'حفظ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ))):
               ElevatedButton(
                
              onPressed: () async{
               await RegController.save();
                showDialog(context: context, builder: (context) {
                  return Dialog(

                            child: Container(
                              height: 80,
                              child: Center(                              
                                child:
                                 Text("${RegController.SaveError}")
                                 
                                ),
                            ),
                          );
                },
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Adjust the border radius as needed
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xffCDD8C7)), // Button background color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30,vertical: 10)), // Button padding
              ),
              child: Text(
                'حفظ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Expanded(
              flex: 1,
              child:  Container(
                alignment: Alignment.center,
                
                child: GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11
                  ),
                  "ثمن المواد المدفوعة : ${(RegController.Hours*33)+55}");
                  },
                ),
              )
              ),
              Expanded(
              flex: 1,
              child:  Container(
              alignment: Alignment.center,
                
                child: GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11
                  ),
                  "عدد الساعات المسجلة : ${RegController.Hours}");
                  },
                ),
              )
              ),
            ],
          ),
        )
        ,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            textAlign: TextAlign.right,
                controller: availableCourses.textFieldController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0)
                ),
              ),
        ),
        
        Container(
          margin: EdgeInsets.symmetric(vertical: 14),
          child: Center(
            
            child: Text(
              textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                      
                    ),
                    "لتسجيل أي مساق خارج الخطة أو مساق حر أدخل رقم المساق:"),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: 
          GetBuilder<getAvailableCourses>(
            builder: 
          (controller) {
            
            return
            controller.StatusRequestSearch==statusRequest.loading?
            Skeletonizer(
          enabled: true,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Adjust the border radius as needed
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xffCDD8C7)), // Button background color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30,vertical: 10)), // Button padding
              ),
            child: Text("البحث"),
          onPressed: () {
            
          },
          )
              ):
             ElevatedButton(
              onPressed: () async{
                await availableCourses.Search_Free_Courses(availableCourses.textFieldController.text);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Adjust the border radius as needed
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xffCDD8C7)), // Button background color
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30,vertical: 10)), // Button padding
              ),
              child: Text(
                'البحث',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },)
          ,
        ),
        GetBuilder<getAvailableCourses>(
          init: getAvailableCourses(),
          builder: 
        (controller) {
          return Column(
            children: [
              controller.SearchError==""?Column(
                
              children: 
              
               controller.StatusRequestSearch==statusRequest.loading?
               [
                Center(
                  child: Text(""),
                )
               ]:
               controller.StatusRequestSearch==statusRequest.error?
               [
                Center(
                  child: Text("حدث خطأ"),
                )
               ]:
               controller.StatusRequestSearch==statusRequest.noContent?
               [
                Center(
                  child: Text("لم يتم اختيار اي مواد بعد"),
                )
               ]:
               controller.FreeCourses
              
        ):
        Center(
          child: Text(controller.SearchError),
        )
              ,
              Column(
                
              children: 
              
               controller.StatusRequest==statusRequest.loading?
               [
                Center(
                  child: CircularProgressIndicator(),
                )
               ]:
               controller.StatusRequest==statusRequest.error?
               [
                Center(
                  child: Text("حدث خطأ"),
                )
               ]:
               
               controller.AvilableCourses
              
        ),
            ],
          );
        },
        )
      
        ]),
      ),
      backgroundColor: ColorsApp.backgroundColor
    );
    },
    );
     
  }
}

