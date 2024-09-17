import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

class CourseTitleRow extends StatelessWidget {
  const CourseTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
        final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        //color: ColorsApp.SemesterRowTitleBackgroundColor,
      ),
      width: Get.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "من | إلى | الأيام",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 9
                          : textScaleFactor > 1.45
                              ? 10
                              : 12,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "اسم المساق",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 9
                          : textScaleFactor > 1.45
                              ? 10
                              : 12,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text("رقم المساق",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 12,
                                color: Color(0xffB6B6B6),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: Text("",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }
}
