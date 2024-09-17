import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Requests/DialogCourseWithDraw.dart';

class WithDrawSub extends StatelessWidget {
  const WithDrawSub(
      {super.key,
      required this.Button,
      required this.TeacherName,
      required this.SubjectName,
      required this.crsNo,
      required this.classNo,
      this.crsTime,
      required this.roomNo,
      required this.rowId
      
      });
  final bool Button;
  final String TeacherName;
  final String SubjectName;
  final roomNo;
  final crsTime;
  final crsNo;
  final classNo;
  final rowId;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Button==true?TextButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return 
                             DialogWithDraw(SubjectName: SubjectName,RowId:rowId);
                          
                        },
                        );
                      },
                      child: Text(
                        "سحب",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )):Text(""),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "اسم المساق : ${SubjectName.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "${ classNo }: الشعبة ",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "${crsNo}:رقم المساق ",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "${crsTime}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "${TeacherName}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "${roomNo}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}


