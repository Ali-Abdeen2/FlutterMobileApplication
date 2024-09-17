import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

class CourseTitleSpecific extends StatelessWidget {
  const CourseTitleSpecific({super.key});

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
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                    "العلامة",
                  style: TextStyle(
                          fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 8
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                    "المتطلب السابق",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 8
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "س. المعتمدة",
                  style: TextStyle(
                    fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 8
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "اسم  المساق",
                  style: TextStyle(
                     fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 8
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 4,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "رقم المساق",
                  style: TextStyle(
                     fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 8
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
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
