import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RegisterController/RegisterController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';

class CourseRow extends StatelessWidget {
  const CourseRow({super.key,required this.crsNo,required this.courseName,required this.crsTime,required this.CrsSeq,this.classNo});
  
  final crsNo;
  final courseName;
  final crsTime; 
  final CrsSeq;
  final classNo;
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
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 14
                        ),
                        
                      )),
                ),
                
                Expanded(
                  flex: 5,
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
                  flex: 3,
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
                  child: Container(
                      alignment: Alignment.center,
                      child: GetBuilder<RegisterController>(
                        init: RegisterController(),
                        builder: 
                      (controller) {
                        return InkWell(
                        onTap: () async{
                          print(crsNo);
                          print(CrsSeq);
                          print(classNo);
                          Map data={
                            "CrsNo":crsNo,
                            "CrsSeq":CrsSeq,
                            "ClassNo":classNo
                          };
                         await controller.Delete_Data(data);
                         controller.StatusRequestDelete==statusRequest.loading?
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
                          ):
                          Text("");
                         
                          //print(courseName);
                          
                        },
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                         alignment: Alignment.center,
                          child: Text(
                            "حذف",
                            
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: textScaleFactor >= 2
                                ? 8
                                : textScaleFactor > 1.45
                                    ? 7
                                    : 10,
                              color: Colors.red, ),
                          ),
                        ),
                      );
                      },
                      )),
                )
              ],
            ),
          ),
        );
  }
}