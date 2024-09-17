import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RegisterController/RegisterController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowDialog.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowTitleDialog.dart';
import 'package:hebron_university_app/view/widget/Register/TitleLabel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseRowspecific extends StatelessWidget {
  const CourseRowspecific({super.key,
  required this.crsNo,
  required this.courseName,
  required this.crsTime,
  required this.CrsSeq,
  required this.crsHours
  });
  
  final crsNo;
  final courseName;
  final crsTime; 
  final CrsSeq;
  final crsHours;
  @override
  Widget build(BuildContext context) {
            final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: ColorsApp.StudyPlanSchedulColor,
              borderRadius: BorderRadius.circular(10)),
          width: Get.width,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Expanded(
                  flex: 2,
                  child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "${crsTime.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 14
                        ),
                        
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "${crsTime}",
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 14
                        ),
                        
                      )),
                ),
                
                Expanded(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${crsHours}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 14,
                                fontWeight: FontWeight.w400,
                          color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${courseName.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 13,
                                fontWeight: FontWeight.w400,
                          color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${crsNo}",
                        
                        style: TextStyle(
                          fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 14,
                                fontWeight: FontWeight.w600,
                          color: Colors.black),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Container(
                  color: Colors.grey,
                  child: Text(""),
                  width: 6,
                  height: double.infinity,
                ),
                Expanded(
                  flex: 2,
                  child:
                 
                  
                  GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (controller) {
                    return
                      controller.availableCourses.StatusRequest==statusRequest.loading?
                         Skeletonizer(child: InkWell(
                          child: Text("ضافة"),
                         )):
                     InkWell(
                    onTap: () async{
                       print(crsNo);
                            print(CrsSeq);
                            Map data={
                              "CrsNo":crsNo,
                              "CrsSeq":CrsSeq
                            };
                            await controller.get_available_classes(data);
                            showDialog(
                              
                                context: context,
                                builder: (BuildContext context1) {
                                  
                                  return AlertDialog(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      
                    ),
                    contentPadding: EdgeInsets.all(4),
                    titlePadding: EdgeInsets.all(0),
                  
                    backgroundColor: Color(0xff697264),
                    title: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text("${courseName.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                           
                            child: Divider(
                              color: Colors.white,
                              thickness: 10,
                              
                            ),
                          )
                        ],
                      ),
                    ),
                    content: Container(
                      width: Get.width,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          CourseRowTitleDialog(),
                          Column(
                            children:controller.StatusRequestclasses==statusRequest.loading?
                            [
                              Center(
                                child: CircularProgressIndicator(),
                              )
                            ]:
                            controller.StatusRequestclasses==statusRequest.error?
                            [
                              Center(
                                child:Text("حدث خطأ")
                              )
                            ]:
                            controller.AvilableClasses
                            
                          )
                          ],
                      ),
                    ),
                                  );
                                },
                              );
                    },
                    child: Container(
                      
                        alignment: Alignment.center,
                        child: GetBuilder<RegisterController>(
                          init: RegisterController(),
                          builder: (controller) {
                          return
                          
                           InkWell(
                         
                          child: Text(
                            "اضافة",
                            
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: textScaleFactor >= 2
                                ? 8
                                : textScaleFactor > 1.45
                                    ? 7
                                    : 10,
                              color: Colors.red, ),
                          ),
                        );
                        },)
                        ),
                  );
                  },
                  )
                   ,
                )
              ],
            ),
          ),
        );
  }
}