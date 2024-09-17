import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RegisterController/RegisterController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constatnt/ColorsApp.dart';

class CourseRowDialog extends StatelessWidget {
  const CourseRowDialog({super.key,required this.crsTime,required this.courseName,
  required this.crsNo,required this.teacherName,
  required this.crsSeq,required this.classNo,
  required this.roomNo,
  required this.isOpen
  
  });
  final crsTime;
  final courseName;
  final crsNo;
  final teacherName;
  final crsSeq;
  final classNo;
  final roomNo;
  final isOpen;

  @override
  Widget build(BuildContext context) {
                final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              color: ColorsApp.StudyPlanSchedulColor,
              borderRadius: BorderRadius.circular(10)),
          width: Get.width,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                
                Expanded(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        isOpen==true?
                        "مفتوحة":
                        "مغلقة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                         fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                                fontWeight: FontWeight.w400,
                          color: Colors.black),
                      )
                      ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "${crsTime.toString().trim().split(RegExp(r'\s+')).join(" ").split(",").join(", ")}",
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                        ),
                        
                      )),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${teacherName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                          fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                                fontWeight: FontWeight.w400,
                          color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${roomNo.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                        
                        style: TextStyle(
                          fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                                fontWeight: FontWeight.w400,
                          color: Colors.black),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Container(
                  color: Colors.grey,
                  child: Text(""),
                  width: 3,
                  height: double.infinity,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      
                      alignment: Alignment.center,
                      child: GetBuilder<RegisterController>(
                        init:  RegisterController(),
                        builder: (controller) {
                        return
                        controller.StatusRequestAdd==statusRequest.loading?
                        Skeletonizer(child:
                        InkWell(
                          child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text("تسجيل"
                                              ,
                                              style: TextStyle(
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w600,
                          fontSize: textScaleFactor >= 2
                            ? 6
                            : textScaleFactor > 1.45
                                ? 7
                                : 8,
                                              ),
                                              ),
                        ),
                        )
                         ):
                         InkWell(
                        child: Container(
                          
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text("تسجيل"
                                              ,
                                              style: TextStyle(
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w600,
                          fontSize: textScaleFactor >= 2
                            ? 6
                            : textScaleFactor > 1.45
                                ? 7
                                : 8,
                                              ),
                                              ),
                        ),
                      onTap: () async{
                        print(crsNo);
                        print(crsSeq);
                        print(classNo);

                        Map data={
                          "crsNo":crsNo,
                          "crsSeq":crsSeq,
                          "classNo":classNo
                        };
                        
                        await controller.AddCourse(data);
                        Navigator.of(context).pop();
                        if(controller.StatusRequestAdd==statusRequest.error)
                        {
                            showDialog(context: context, builder: (context) {
                          return Dialog(

                            child: Container(
                              height: 80,
                              child: Center(                              
                                child:
                               
                                 Text("حدث خطأ بالعملية")
                                
                                ),
                            ),
                          );
                          },
                          );
                        }
                        else
                        {
                           showDialog(context: context, builder: (context) {
                          return Dialog(

                            child: Container(
                              height: 160,
                              child: Center(                              
                                child:
                               
                                 Text("${controller.AddError}",textAlign: TextAlign.center,)
                                
                                ),
                            ),
                          );
                          },
                          );
                         
                        }
                       

                      },
                     
                      );
                      },)
                      ),
                )
              ],
            ),
          ),
        );
  }
}